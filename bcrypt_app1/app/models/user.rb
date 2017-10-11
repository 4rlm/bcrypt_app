class User < ActiveRecord::Base
  # users.pw_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(pw_hash)
  end

  def password=(new_password)
    @password = Password.create(pw_hash)
    self.pw_hash = @password
  end

  # def self.authenticate(email, password)
  #   user = User.find_by_email(email)
  #   if user && user.pw_hash == password
  #     return user
  #   else
  #     nil
  #   end
  # end

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user && @user.pw_hash == password
      give_token
    else
      redirect '/users'
    end
  end


  # def login
  #   @user = User.find_by_email(params[:email])
  #   if @user.password == params[:password]
  #     give_token
  #   else
  #     redirect_to home_url
  #   end
  # end



end
