require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  # flash[:message] = "Please Enter a Category Name"
  # flash[:alert] = "Hooray, Flash is working!"
  # flash[:success_alert] = "It was successful!"
  # flash[:error_alert] = "There was an error."


  get '/' do
    not_logged_in ? redirect_to_users : logged_in
  end

  helpers do

    def not_logged_in
      !session[:user_id]
    end

    def logged_in
      current_user unless @user.present?
      flash[:success_alert] = "Welcome, #{@user.name}!"
      redirect_to_home_page
    end

    def current_user
      @user = User.find(session[:user_id])
    end

    # def redirect_if_not_logged_in
    #   binding.pry
    #   if !logged_in?
    #     redirect "/login"
    #   end
    # end



    #################
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

end
