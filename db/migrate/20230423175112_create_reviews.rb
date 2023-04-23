class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :recommend
      t.text :content
      t.references :viewing, null: false, foreign_key: true
      t.integer :show_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
