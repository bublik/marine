class UsersController < ApplicationController
  skip_filter :authenticate_user!, :if => proc { |c| [:enter, :get_access].include?(c.action_name.to_sym) }

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def enter
    if current_user
      redirect_to(new_personals_path)
      return
    end

    @user = User.new
    render layout: 'light'
  end

  def get_access
    @present = false
    @user = User.find_by(email: user_params[:email])
    @user ||= User.create_by_email(user_params[:email])

    unless @user.new_record?
      @present = true
      Notifications.access_link(@user).deliver
    else
      flash.now[:error] = @user.errors.full_messages.join(',')
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email)
  end
end
