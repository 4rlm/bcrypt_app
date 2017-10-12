require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  include ApplicationHelper

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    not_logged_in ? redirect_to_users : logged_in
  end

end
