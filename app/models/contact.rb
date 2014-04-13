class Contact < ActiveRecord::Base
  belongs_to :country
  validates :country_id, :city, :street, :mphone, presence: true
  validates :phone, presence: true, if: :the_first_contact?

  #когда нет записей или эта запись первая
  def the_first_contact?
    self.user.contact.blank? || self.user.contact.first.id.eql?(self.id)
  end

end
