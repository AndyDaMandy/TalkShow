# frozen_string_literal: true

# Belongs to show for persistent data without TMDB
class Season < ApplicationRecord
  belongs_to :show
end
