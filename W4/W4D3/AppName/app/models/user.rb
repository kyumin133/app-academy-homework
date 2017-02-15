class User < ActiveRecord::Base
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validate :check_password_length
  before_validation :ensure_session_token

  attr_reader :password
  def check_password_length
    @min_password_length = 6
    if @password.nil? || @password.length < @min_password_length
      self.errors[:Password] << "must be at least length #{@min_password_length}."
    end
  end

  def self.find_by_credentials(username, password)
    password_digest = BCrypt::Password.create(password)
    self.where(username: username, password_digest: password_digest).first
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
