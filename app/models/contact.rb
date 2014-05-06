class Contact < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  validates :country_id, :user_id, :city, :street, :mphone, presence: true
  validates_presence_of :email, if: :the_first_contact?
  validates_presence_of :next_of_kin, if: :next_of_kin_contact?

  #когда нет записей или эта запись первая
  def the_first_contact?
    user.contacts.blank? || user.contact.id.eql?(self.id)
  end

  def next_of_kin_contact?
    (user.contacts.count >= 1) && !user.contact.id.eql?(self.id)
  end

end
