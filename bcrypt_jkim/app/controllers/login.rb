enable :sessions

get '/login' do
  # Look in app/views/index.erb
  redirect to("/success") if session[:user_id]
  erb :login, locals:{create:false,error:false}
end

get '/login/new' do
  redirect to("/success") if session[:user_id]
  erb :login, locals:{create:true,error:false}
end

post '/login/new' do
  redirect to("/success") if session[:user_id]
  new_user = User.create(params[:user])
  if new_user.invalid?
    erb :login, locals:{create:true, error:new_user.errors.full_messages}
  else
  # Look in app/views/index.erb
  redirect to("/login")
  end
end

post '/login' do
  user = User.authenticate(params[:user][:email_address],params[:user][:password])
  p user
  if user != nil
    session[:user_id] = user.id
    redirect to("/success")
  else

  # Look in app/views/index.erb
    redirect to("/login")
  end
end

get '/success' do
  redirect to("/login") unless session[:user_id]
  # Look in app/views/index.erb
  erb :success
end

get '/logout' do
  session.delete(:user_id)
  redirect to("/login")
end
