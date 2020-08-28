class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.belongs_to :user
      t.string :title
    end
  end
end
