class ContactDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def short_address
    [object.postal_code, object.street, object.city, object.region, object.country.name].join(', ')
  end

  def cv_address
    [object.street, object.city, object.country.name].join(', ')
  end

  def mphone
    h.number_to_phone(object.mphone)
  end

  def phone
    h.number_to_phone(object.phone)
  end

end
