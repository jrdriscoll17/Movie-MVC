class Movie  < ActiveRecord::Base
    has_many :actors
    has_many :genres
    belongs_to :user
end