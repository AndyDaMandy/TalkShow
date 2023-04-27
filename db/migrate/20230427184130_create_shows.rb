class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :tmdb_id
      t.string :origin_country
      t.string :original_language
      t.string :original_name
      t.string :overview
      t.string :poster_path
      t.string :first_air_date
      t.string :name

      t.timestamps
    end
  end
end
