# frozen_string_literal: true

# Viewing for seasons
class SeasonViewing < ApplicationRecord
  belongs_to :show
  belongs_to :user
  belongs_to :viewing

  enum status: %i[not_started watching on_hold finished], prefix: :seasons_viewing
  # hidden, content_id = tmdb's season id
  # hidden, tmdb_id = show's id
end
