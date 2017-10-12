module ApplicationHelper

  # flash[:message] = "Please Enter a Category Name"
  # flash[:alert] = "Hooray, Flash is working!"
  # flash[:success_alert] = "It was successful!"
  # flash[:error_alert] = "There was an error."

  def not_logged_in
    !session[:user_id]
  end

  def logged_in
    if @user
      flash[:success_alert] = "Welcome, #{@user.name}!"
      redirect_to_home_page
    else
      current_user
    end
  end

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_to_home_page
    erb :'index'
  end

  def redirect_to_entries
    redirect '/entries'
  end

  def redirect_to_users
    redirect '/users'
  end

end
helpers ApplicationHelper
