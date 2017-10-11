class User < ActiveRecord::Base
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

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.pw_hash == password
      @user = user
    else
      @user = nil
    end
  end

end
