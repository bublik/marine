# == Schema Information
#
# Table name: agency_subscriptions
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  is_active  :boolean          default(TRUE)
#  created_at :datetime
#  updated_at :datetime
#

class AgencySubscription < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  scope :active, -> { where(is_active: true) }

  def self.migrate_from_crewing

    User.includes(:contact).crewings.each do |user|
      # мы не шлем не верифицированным агенствам письма с новыми анкетами
      next if !user.verified? || user.contact.nil?

      AgencySubscription.find_or_create_by(email: user.contact.email) do |subscription|
        subscription.name = user.company_name
      end
    end
  end

end
