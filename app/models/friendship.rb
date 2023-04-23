class Friendship < ApplicationRecord
  belongs_to :user

  enum status: %i[ sent withdrawn accepted declined ]
end
