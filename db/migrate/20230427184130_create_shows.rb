class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.integer :tmdb_id

      t.timestamps
    end
  end
end
