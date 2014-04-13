class Contact < ActiveRecord::Base
  belongs_to :country

  validates :country_id, :city, :street, :mphone, presence: true
  validates :email, presence: true, if: :the_first_contact?

  #когда нет записей или эта запись первая
  def the_first_contact?
    #TODO change when we will add user references
    true || self.user.contact.blank? || self.user.contact.first.id.eql?(self.id)
  end

end
