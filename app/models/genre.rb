class Genre < ActiveRecord::Base
    has_many :movie_genres
    has_many :movies, through: :movie_genres
    has_many :actors, through: :movies

    @@genres = [
        {:name => "​Action"},
        {:name => "Animation"},
        {:name => "Comedy"},
        {:name => "Crime"},
        {:name => "Drama"},
        {:name => "Experimental"},
        {:name => "Fantasy"},
        {:name => "Historical"},
        {:name => "Horror"},
        {:name => "Romance"},
        {:name => "Science Fiction"},
        {:name => "Thriller"},
        {:name => "Western"},
        {:name => "Other"}
        ]

    def self.default_genres 
        @@genres
    end
end