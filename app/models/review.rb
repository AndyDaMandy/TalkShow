class Review < ApplicationRecord
  belongs_to :viewing
  belongs_to :user

  enum rating: %i[ zero one two three four five ]
end
