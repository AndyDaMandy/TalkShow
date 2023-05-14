# frozen_string_literal: true

# recommend model is dependent on the show, the friendship, or the user.
class Recommend < ApplicationRecord
  belongs_to :user
  belongs_to :show
  belongs_to :friendship
end
