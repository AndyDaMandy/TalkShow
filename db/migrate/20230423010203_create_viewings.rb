# frozen_string_literal: true
class CreateViewings < ActiveRecord::Migration[7.0]
  def change
    create_table :viewings do |t|
      t.integer :status, default: 0
      t.text :note
      t.integer :tmdb_id
      t.string :name
      t.integer :progress, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
