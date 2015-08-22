class Authenticator
  def initialize(email, password)
    @user = load_user(email)
    @password = password
  end

  def authenticate
    authentic? ? @user : nil
  end

  private

  def authentic?
    @user.present? && password(@user) == @password
  end

  def load_user(email)
    ROM.env.relation(:users).by_email(email).map_with(:user).first
  end

  # Returns a `SCrypt::Password`, which of course is only useful
  # for *comparison* (`#==`) to a plaintext password.
  def password(user)
    SCrypt::Password.new(user.password_digest)
  end
end
