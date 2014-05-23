# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  country_id  :integer
#  region      :string(255)
#  city        :string(255)
#  street      :string(255)
#  postal_code :string(255)
#  airport     :string(255)
#  phone       :string(255)
#  mphone      :string(255)
#  email       :string(255)
#  skype       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer          not null
#  next_of_kin :string(255)
#  name        :string(255)
#

class Contact < ActiveRecord::Base
  belongs_to :country
  belongs_to :user
  #KINS = []

  validates :country_id, :user_id, :city, :street, :mphone, presence: true
  validates_presence_of :email, if: :the_first_contact?
  validates_presence_of :next_of_kin, if: :next_of_kin_contact?
  validates_presence_of :name, if: :next_of_kin_contact?
  #validates_inclusion_of :next_of_kin, in: Contact::KINS, if: :next_of_kin_contact?

  #когда нет записей или эта запись первая
  def the_first_contact?
    user.contacts.blank? || user.contact.id.eql?(self.id)
  end

  def next_of_kin_contact?
    (user.contacts.count >= 1) && !user.contact.id.eql?(self.id)
  end

end
