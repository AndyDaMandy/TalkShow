# frozen_string_literal: true
class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :recommend
      t.string :headline
      t.text :content
      t.references :viewing, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :tmdb_id

      t.timestamps
    end
  end
end
