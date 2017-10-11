class UsersController < ApplicationController

  # def initialize
  #   @user = nil
  #   binding.pry
  # end

  # INDEX: users view all.
  get '/users' do
    binding.pry
    if session[:user_id]
      binding.pry
      redirect '/success'
    else
      binding.pry
      erb :'users/login'
      # erb :'users/login', locals: {create:false, error:false}
    end

  end

  # NEW: users new
  get '/users/new' do
    if session[:user_id]
      redirect '/success'
    else
      binding.pry
      @user = User.new  ## Prevents errors on Form Partial.
      erb :'users/new'
      # erb :login, locals: { create:true, error:false }
    end

  end

  post '/users' do
    if session[:user_id]
      redirect '/success'
    else
      new_user = User.create(params[:user])
    end

    if new_user.invalid?
      binding.pry
      erb :'users/new'
      # erb :login, locals:{create:true, error:new_user.errors.full_messages}
    else
      @user = User.authenticate(params[:user][:email], params[:user][:pw_hash])
      session[:user_id] = @user.id
      binding.pry
      redirect '/login'
    end

  end

  ###############
  get '/login' do
    binding.pry

    if @user != nil
      binding.pry
      session[:user_id] = @user.id
      redirect '/success'
    else
      binding.pry
      redirect '/login'
    end
  end


  ################



  # get '/users/login' do
  #   @user = User.new
  #   erb :'users/login'
  # end
  #
  # post '/users/login' do
  #   binding.pry
  # end

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


  get '/success' do
    if session[:user_id]
      binding.pry
      erb :'users/success'
    else
      binding.pry
      redirect '/users'
    end
  end

  get '/logout' do
    session.delete(:user_id)
    # redirect to("/login")
    redirect to("/users")
  end

  # post '/login' do
  #   binding.pry
  #   user = User.authenticate(params[:user][:email], params[:user][:password])
  #
  #   if user != nil
  #     session[:user_id] = user.id
  #     # redirect to("/success")
  #     binding.pry
  #   else
  #     binding.pry
  #   # Look in app/views/index.erb
  #     # redirect to("/login")
  #   end
  #
  # end


end
