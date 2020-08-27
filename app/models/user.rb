class User < ActiveRecord::Base
    has_many :movie_users
    has_many :movies, through: :movie_users

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    
    has_secure_password
end