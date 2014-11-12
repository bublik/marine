class NotificationsPreview < ActionMailer::Preview

  def access_link
    Notifications.access_link(user)
  end

  def thank_email
    Notifications.thank_email(user)
  end

  def new_user_cv
    Notifications.new_user_cv(agency, personal)
  end

  def crewing_credentials
    Notifications.crewing_credentials(user)
  end

  def account_verified
    Notifications.account_verified(user)
  end

  def new_crewing_created
    Notifications.new_crewing_created(User.admins.first, User.agencies.last)
  end

  private
  def personal
    user.personal.decorate
  end

  def agency
    AgencySubscription.last
  end

  def user
    user = User.find(12) || User.find_by(:email, 'rebisall@gmail.com') || User.last
  end
end