# == Schema Information # # Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  authentication_token   :string(255)      default("")
#  accept_subscription    :boolean          default(TRUE)
#  uuid                   :string(255)      not null
#  cv_updated_at          :datetime
#  phone                  :string(255)
#  company_name           :string(255)
#  country_id             :integer
#  role                   :string(255)      default("user")
#  verify_at              :datetime
#  parent_id              :integer
#  locked_at              :datetime
#  unlock_token           :string(255)
#  crew_id                :integer
#

class User < ActiveRecord::Base
  ROLES = ['user', 'manager', 'crewing', 'admin']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, # :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  attr_accessor :create_by_email, :email_confirmation, :failed_attempts

  belongs_to :country
  belongs_to :agency, foreign_key: :crew_id, class_name: 'User'
  belongs_to :creator, foreign_key: :parent_id, class_name: 'User'

  has_one :personal
  accepts_nested_attributes_for :personal

  has_many :contacts
  has_one :contact, -> { order 'created_at' }, inverse_of: :user, class_name: 'Contact'
  accepts_nested_attributes_for :contact

  has_one :next_of_kin_contact, -> { order('created_at').offset(1) }, class_name: 'Contact'

  has_many :certificates
  has_many :seaservices
  has_many :langs
  has_many :languages, through: :langs

  has_many :managers, -> { where(role: 'manager') }, foreign_key: :parent_id, class_name: 'User'
  has_many :orders

  validates :accept_subscription, :acceptance => {:accept => true}
  validates_presence_of :email_confirmation, message: 'Please confirm email', if: :create_by_email
  validates :email, presence: true
  validates :phone, :name, :company_name, :country_id, presence: true, if: :crewing?
  validates :parent_id, presence: true, if: :manager?

  scope :newer, -> { order('id desc') }
  scope :completed, -> { where('cv_updated_at IS NOT NULL') }

  ROLES.each do |role|
    scope role.pluralize, -> { where(role: role) }
    define_method("#{role}?") { self.role.eql?(role) }
  end
  scope :agencies, -> { where(role: 'crewing') }

  before_create :generate_token
  before_save :create_uuid
  after_create :send_notification

  after_update :send_verification_notification

  def create_uuid
    self.uuid = UUID.new.generate if self.uuid.blank?
  end

  def cv_updated!
    self.update_attribute(:cv_updated_at, Time.now)
  end

  def generate_token
    self.authentication_token = Devise.friendly_token.first(12)
  end

  def medical_certificates
    certificates.joins(:cert).where(certs: {category: 'medical'}).order(:from_date)
  end

  def documents
    certificates.joins(:cert).where(certs: {category: 'documents'}).order(:from_date)
  end

  def head_contact
    if self.crew_id.blank?
      # контакт первого админа если пользоватеть сам зарегался
      User.admin.contact
    else
      # Контакт агенства если пользователь зарегался из под агенства
      self.agency.contact
    end
  end

  def intivation_token
    return self.uuid if crewing? || admin?

    if self.crew_id.blank?
      # контакт первого админа если пользоватеть сам зарегался
      User.admins.first.uuid
    else
      # Контакт агенства если пользователь зарегался из под агенства
      self.agency.uuid
    end
  end

  def completed?
    self.cv_updated_at.present?
  end

  def self.admin
    Rails.cache.fetch('users_admin', expires_in: 5.minutes) { User.admins.first }
  end

  def self.create_by_email(param)
    email = param[:email]
    email_confirmation = param[:email_confirmation]

    logger.debug("#{email} #{email_confirmation }")
    password = Devise.friendly_token.first(6)
    user = User.new(email: email,
                    create_by_email: true,
                    email_confirmation: email_confirmation,
                    crew_id: param[:crew_id],
                    password: password,
                    password_confirmation: password)
    user.save
    user
  end

  def self.create_crewing(param)
    create_user(param, nil, 'crewing')
  end

  def self.create_manager(param, creator)
    create_user(param, creator, 'manager')
  end

  def self.create_seafarer(param, creator)
    create_user(param, creator)
  end

  def self.create_user(param, creator, role = 'user')
    password = Devise.friendly_token.first(8)
    user = User.new(param.merge(password: password,
                                password_confirmation: password))

    if creator
      user.parent_id = creator.id
      user.crew_id = creator.parent_id if creator.manager?
      user.crew_id = creator.id if creator.admin? || creator.crewing?
    end

    user.role = role
    user.save
    user
  end

  def verified?
    verify_at.present?
  end

  def can_edit?(user)
    return true if self.admin?
    logger.info("user.crew_id #{user.crew_id} == self.crew_id #{self.crew_id}")
    user.crew_id && user.crew_id.eql?(self.crew_id) && (self.crewing? || self.manager?)
  end

  def verify!
    self.verify_at = Time.now
    save
  end

  def deverify!
    self.verify_at = nil
    save
  end

  def send_notification
    if crewing? || manager?
      Notifications.crewing_credentials(self).deliver
      logger.info("New Crewing #{id} #{email}")
    end

    if crewing?
      User.admins.each do |admin|
        Notifications.new_crewing_created(admin, self).deliver
      end
    end
  end

  def send_verification_notification
    if crewing? && self.verify_at_changed?
      Notifications.account_verified(self).deliver if verified?
      logger.info("Account activation changed #{self.verify_at}!")
    end
  end

end
