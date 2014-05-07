# == Schema Information
#
# Table name: users
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
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, # :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :personal
  has_many :contacts
  has_one :contact, -> { order 'created_at' }, class_name: 'Contact'
  has_one :next_of_kin_contact, -> { order('created_at').offset(1) }, class_name: 'Contact'

  has_many :certificates
  has_many :seaservices
  has_many :langs

  validates :accept_subscription, :acceptance => {:accept => true}

  before_create :generate_token
  before_save :create_uuid

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

  def self.create_by_email(email = '')
    password = Devise.friendly_token.first(6)
    user = User.new(email: email, password: password, password_confirmation: password)
    user.save
    user
  end

end
