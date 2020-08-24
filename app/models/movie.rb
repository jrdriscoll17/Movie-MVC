class Movie  < ActiveRecord::Base
    has_many :actors, :genres
    belongs_to :user
end