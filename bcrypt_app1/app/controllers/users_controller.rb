class UsersController < ApplicationController
  include UsersHelper

  get '/users' do
    not_logged_in ? (erb :'users/login') : logged_in
  end

  get '/users/login' do
    if @user && @user.valid?
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

  get '/users/:id' do
    if params[:id] == "logout"
      session[:user_id] = nil
      @user = nil
      redirect '/users/login'
    else
      @user = User.find(params[:id])
      erb :'users/show'
    end
  end

  # EDIT:
  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  # UPDATE: patch
  patch '/users/:id' do
    update_user
  end

  # UPDATE: put
  put '/users/:id' do
    update_user
  end

  # DELETE:
  delete '/users/:id' do
    User.find(params[:id]).destroy!
    redirect '/users'
  end

end
