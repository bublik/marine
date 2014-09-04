class HomeController < ApplicationController
  skip_filter :authenticate_user!

  def index

  end

  def feedback
    @contact = Contact.new(params[:contact].permit!)
    @contact.user = User.new

    @contact.errors['comments'] = "Message can't be blank." if @contact.comments.blank?
    @contact.errors['email'] = "Email can't be blank." if @contact.email.blank?

    if request.post? && @contact.errors.blank?
      Notifications.feedback(@contact)
      redirect_to root_path, notice: 'Your message was sent!'
      return
    else
      flash[:error] = @contact.errors.full_messages.join(',')
    end
  end
end
