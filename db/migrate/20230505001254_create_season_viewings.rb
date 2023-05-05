# frozen_string_literal: true
class CreateSeasonViewings < ActiveRecord::Migration[7.0]
  def change
    create_table :season_viewings do |t|
      t.integer :tmdb_id
      t.integer :content_id
      t.references :show, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :viewing, null: false, foreign_key: true
      t.integer :status, default: 0
      t.text :note
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
