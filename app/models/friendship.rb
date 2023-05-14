# frozen_string_literal: true

# Handles friendship, many to many relationship between users
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  has_many :recommends, dependent: :destroy

  enum status: %i[sent withdrawn accepted declined]
end
