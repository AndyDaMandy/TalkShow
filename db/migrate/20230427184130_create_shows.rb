# frozen_string_literal: true
class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.integer :tmdb_id
      t.string :original_name
      t.string :original_language
      t.string :name
      t.string :overview
      t.string :poster_path

      t.timestamps
    end
  end
end
