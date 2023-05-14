# frozen_string_literal: true

# Show clas, unused currently
class Show < ApplicationRecord
  has_many :recommends, dependent: :destroy

  validates :tmdb_id, presence: true
end
