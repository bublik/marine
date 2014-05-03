class Notifications < ActionMailer::Base
  default from: "noreplay@example.com"

  def access_link(user = '')
    @user = user
    mail(to: @user.email)
  end

end