# frozen_string_literal: true

# Currently unused
class Review < ApplicationRecord
  belongs_to :viewing
  belongs_to :user

  validates :rating, length: { minimum: 0, maximum: 5 }
  enum recommend: %i[no_judgement no maybe yes]
  # enum rating: %i[zero one two three four five]
end
