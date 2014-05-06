class NotificationsPreview < ActionMailer::Preview

  def access_link
    user = User.last
    Notifications.access_link(user)
  end

  def thank_email
    user = User.last
    Notifications.thank_email(user)
  end
end