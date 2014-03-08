class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  # validating the user's *name* attr
  validates :name, presence: true, length: { maximum: 50 }

  # validating the user's *email* attr
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  # for password
  has_secure_password
  validates :password, length: { minimum:6 }
end
