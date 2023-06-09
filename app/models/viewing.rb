# frozen_string_literal: true

# Model for what users are watching, essentially an view list
class Viewing < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :season_viewings, dependent: :destroy

  enum status: %i[not_started watching on_hold finished]

  validates :status, presence: true
  validates :tmdb_id, presence: true

end
