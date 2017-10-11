class UsersController < ApplicationController

  # INDEX: users view all.
  get '/users' do
    if not_logged_in
      erb :'users/login'
    else
      logged_in
    end
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
    @user = validate_user(params)

    if @user.present?
      session[:user_id] = @user.id
      logged_in
    else
      binding.pry
      flash[:error_alert] = "Invalid Data.  Please try again."
      erb :'users/login'
    end

  end



  get '/register' do
    if not_logged_in
      @user = User.new
      erb :'users/register'
    else
      logged_in
    end
  end


  # NEW: users new
  get '/users/register' do
    if not_logged_in
      @user = User.new  ## Prevents errors on Form Partial.
      erb :'users/register'
    else
      logged_in
    end

  end

  post '/users/register' do
    if not_logged_in
      new_user = User.create(params[:user])
    else
      logged_in
    end

    if new_user.valid?
      @user = validate_user(params)
    end

    if @user.present?
      session[:user_id] = @user.id
      logged_in
    else
      flash[:error_alert] = "Invalid Data.  Please try again."
      @user = User.new
      erb :'users/register'
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
      User.authenticate(params[:user][:email], params[:user][:pw_hash])
    end
  end

end
