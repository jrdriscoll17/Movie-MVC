class Movie < ActiveRecord::Base
    has_many :movie_genres
    has_many :genres, through: :movie_genres

    has_many :movie_actors
    has_many :actors, through: :movie_actors
    
    has_many :movie_users
    has_many :users, through: :movie_users

    # def slug
    #     username.downcase.gsub(" ","-")
    # end

    # def self.find_by_slug(slug)
    #     User.all.find{|user| user.slug == slug}
    # end
end