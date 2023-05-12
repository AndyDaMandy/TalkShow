# frozen_string_literal: true

# Used to recommend a show to another user that's on your friend's list
class Recommend < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  belongs_to :show
end
