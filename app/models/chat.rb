# frozen_string_literal: true

# chat model for the recommendations
class Chat < ApplicationRecord
  belongs_to :recommend
  belongs_to :user
  
end
