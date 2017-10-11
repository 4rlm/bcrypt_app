class User < ActiveRecord::Base
  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :pw_hash, presence: true
  validates :name, :email, :pw_hash, presence: true
  validates :email, uniqueness: true

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

  # def self.authenticate(email, password)
  #   user = User.find_by_email(email)
  #   if user && user.pw_hash == password
  #     return user
  #   else
  #     redirect '/users'
  #   end
  # end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.pw_hash == password
      @user = user
    else
      @user = nil
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
