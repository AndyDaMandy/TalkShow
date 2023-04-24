class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  enum status: %i[ sent withdrawn accepted declined ]
end
