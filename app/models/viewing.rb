class Viewing < ApplicationRecord
  belongs_to :user

  enum status: %i[ not_started watching on_hold finished ]
end
