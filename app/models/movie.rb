class Movie < ActiveRecord::Base
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  has_many :movie_actors
  has_many :actors, through: :movie_actors

  belongs_to :user

  validates :title, :actor_ids, :genre_ids, presence: true
end
