class User < ApplicationRecord

  validates :name, presence: true
  validates :email, email: true, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 8}
end
