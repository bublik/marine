class ContactDecorator < Draper::Decorator
  delegate_all

  def short_address(short = false)
    short ?
      [object.city, object.region, object.country.try(:name)].join(', ') :
      [object.postal_code, object.street, object.city, object.region, object.country.try(:name)].compact.join(', ')
  end

  def cv_address(short = false)
    short ?
      [object.city, object.country.try(:name)].join(', ') :
      [object.street, object.city, object.country.try(:name)].compact.join(', ')
  end

  def mphone(short = false)
    short ? '-' :
      h.number_to_phone(object.mphone)
  end

  def skype(short = false)
    short ? '-' : object.skype
  end

  def email(short = false)
    short ? '-' : object.email
  end

  def phone(short = false)
    short ? '-' :
      h.number_to_phone(object.phone)
  end

end
