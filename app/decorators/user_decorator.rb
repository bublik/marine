class UserDecorator < Draper::Decorator
  delegate_all

  def name
    object.name || object.email
  end

  def full_name
    "#{object.personal.surname} #{object.personal.name}"
  end

  def phone
    h.number_to_phone(object.phone)
  end

  def created_at
    h.l(object.created_at, format: :long)
  end

  def last_sign_in_at
    object.last_sign_in_at ?
      h.l(object.last_sign_in_at, format: :long) : 'never'
  end

  def active
    object.verified? ?
      h.icon('ok text-success') + ' ' + h.l(object.verify_at, format: :long) :
      h.icon('bell text-danger') + ' Waited'
  end

  def link_to_state
    h.link_to(active, h.activation_path(object), class: 'btn btn-default', title: (object.verified? ? 'Deactivate' : 'Activate'), remote: true, method: :post)
  end
end
