# frozen_string_literal: true
class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.integer :friend_id

      t.timestamps
    end
  end
end
