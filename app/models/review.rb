# frozen_string_literal: true

# Currently unused
class Review < ApplicationRecord
  belongs_to :viewing
  belongs_to :user

  validates :rating, length: { minimum: 0, maximum: 5 }
  enum recommend: %i[no_judgement no maybe yes]

  def rating_label
    # This method is going to give you a label for each
    # This will give an opportunity to test with a unit test
    # 0 bad, 1-3 okay, 4, 5 = excellent
  end

end
