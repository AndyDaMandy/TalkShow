class CreateRecommends < ActiveRecord::Migration[7.0]
  def change
    create_table :recommends do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true
      t.integer :tmdb_id

      t.timestamps
    end
  end
end
