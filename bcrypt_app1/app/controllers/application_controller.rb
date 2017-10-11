require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    # flash[:message] = "Please Enter a Category Name"
    # flash[:alert] = "Hooray, Flash is working!"
    # flash[:success_alert] = "It was successful!"
    # flash[:error_alert] = "There was an error."


    # redirect to '/users'


    # if !logged_in?
    #   erb :index, layout: :'not_logged_in_layout' #=> Log In Page
    # else
    #   redirect_to_home_page
    # end

    erb :'index'
  end

  helpers do

    # def logged_in?
    #   !session[:user_id]
    # end
    #
    # def current_user
    #   binding.pry
    #   User.find(session[:user_id])
    # end
    #
    # def redirect_if_not_logged_in
    #   binding.pry
    #   if !logged_in?
    #     redirect "/login"
    #   end
    # end




    def redirect_to_home_page
      redirect to "/"
    end

    def redirect_to_entries
      redirect to '/entries'
    end

    def redirect_to_users
      redirect to '/users'
    end



  end

end
