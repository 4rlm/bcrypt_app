module UsersHelper

  # UPDATE: Method for patch and put
  def update_user
    @user = User.find(params[:id])
    @user.update(params[:user])
    redirect "/users/#{@user.id}"
  end

  def validate_user(params)
    if params.present?
      @user = User.authenticate(params[:user][:email], params[:user][:pw_hash])
      (session[:user_id] = @user.id) unless @user.nil?
    end
  end


end
helpers UsersHelper
