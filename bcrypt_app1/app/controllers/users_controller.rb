class UsersController < ApplicationController

  # INDEX: users view all.
  get '/users' do
    not_logged_in ? (erb :'users/login') : logged_in
  end

  get '/users/login' do
    if @user.valid?
      session[:user_id] = @user.id
      logged_in
    else
      redirect '/users'
    end
  end

  post '/users/login' do
    validate_user(params)

    if @user.nil?
      flash[:error_alert] = "Invalid Data.  Please try again."
      erb :'users/login'
    else
      logged_in
    end

  end


  get '/users/register' do
    not_logged_in ? (erb :'users/register') : logged_in
  end

  post '/users/register' do
    not_logged_in ? new_user = User.create(params[:user]) : logged_in
    validate_user(params) if new_user.valid?

    if @user.nil?
      flash[:error_alert] = "Invalid Data.  Please try again."
      redirect 'users/register'
    else
      logged_in
    end

  end





  # SHOW: displays a single user detail page.
  # get '/users/:id' do
  #   @user = User.find(params[:id])
  #   erb :'users/show'
  # end

  # EDIT:
  # get '/users/:id/edit' do
  #   @user = User.find(params[:id])
  #   erb :'users/edit'
  # end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  # def update_user
  #   @user = User.find(params[:id])
  #   @user.update(params[:user])
  #   redirect "/users/#{@user.id}"
  # end

  # UPDATE: patch
  # patch '/users/:id' do
  #   update_user
  # end

  # UPDATE: put
  # put '/users/:id' do
  #   update_user
  # end

  #################################

  # DELETE:
  # delete '/users/:id' do
  #   User.find(params[:id]).destroy!
  #   redirect '/users'
  # end


  ##################################

  get '/users/logout' do
    session.delete(:user_id)
    flash[:error_alert] = "Successfully logged out.  Login to continue."
    redirect '/users'
  end


  helpers do

    def validate_user(params)
      if params.present?
        @user = User.authenticate(params[:user][:email], params[:user][:pw_hash])
        (session[:user_id] = @user.id) unless @user.nil?
      end
    end

  end

end
