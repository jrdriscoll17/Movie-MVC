class User < ActiveRecord::Base
  has_many :movies

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password
end
