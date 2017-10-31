class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  has_many :goals
  has_many :cheers_given
  has_many :cheers_received, through: :cheers_given, source: :cheers

  attr_reader :password
  after_initialize :ensure_session_token
  after_initialize :ensure_cheer_count

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    hash = BCrypt::Password.new(self.password_digest)
    hash.valid_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
    self.save
    self.session_token
  end

  def ensure_cheer_count
    self.cheer_count ||= 12
  end

  def decrement_cheer_count!
    self.cheer_count = self.cheer_count - 1
    self.save!
  end

end
