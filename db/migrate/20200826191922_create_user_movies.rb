class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :movie_users do |t|
      t.integer :movie_id
      t.integer :user_id
    end
  end
end
