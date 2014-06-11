class ContactDecorator < Draper::Decorator
  delegate_all

  def short_address(short = false)
    short ?
      [object.city, object.region, object.country.name].join(', ') :
      [object.postal_code, object.street, object.city, object.region, object.country.name].join(', ')
  end

  def cv_address(short = false)
    short ?
      [object.city, object.country.name].join(', ') :
      [object.street, object.city, object.country.name].join(', ')
  end

  def mphone(short = false)
    short ? '-' :
      h.number_to_phone(object.mphone)
  end

  def phone(short = false)
    short ? '-' :
      h.number_to_phone(object.phone)
  end

end
