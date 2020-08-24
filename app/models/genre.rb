class Genre < ActiveRecord::Base
    has_many :movies
    has_many :actors, through: :movies

    DEFAULT_GENRES = [
        "​Action",
        "Animation",
        "Comedy",
        "Crime",
        "Drama",
        "Experimental",
        "Fantasy",
        "Historical",
        "Horror",
        "Romance",
        "Science Fiction",
        "Thriller",
        "Western",
        "Other"
    ]

    def self.default_genres 
        DEFAULT_GENRES
    end
end