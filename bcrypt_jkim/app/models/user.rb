
class User < ApplicationRecord
  include BCrypt
  validates :full_name, :email_address, presence:true, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email_address(email)
    if user && user.password == password
      return user
    else
      nil
    end
  end

end
