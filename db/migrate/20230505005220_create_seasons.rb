class CreateSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :seasons do |t|
      t.string :name
      t.integer :content_id
      t.integer :tmdb_id
      t.integer :season_number
      t.integer :episode_count
      t.string :air_date
      t.string :overview
      t.string :poster_path

      t.timestamps
    end
  end
end
