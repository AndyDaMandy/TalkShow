class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :recommend, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :friend_id
      t.text :message

      t.timestamps
    end
  end
end
