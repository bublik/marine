class UserDecorator < Draper::Decorator
  delegate_all

  def name
    object.name || object.email
  end

  def full_name
    "#{object.personal.surname} #{object.personal.name}"
  end

end
