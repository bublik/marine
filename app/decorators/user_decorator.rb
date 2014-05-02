class UserDecorator < Draper::Decorator
  delegate_all

  def name
    object.name || object.email
  end
end
