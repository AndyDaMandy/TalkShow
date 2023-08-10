# frozen_string_literal: true

FactoryBot.define do
  factory :viewing do
    status { 'watching' }
    note { 'I love movies and such, they arere pretty cool if you ask me.' }
    name { 'The Good Place' }
    tmdb_id { 12203 }
    progress { 0 }
    user_id { 1 }
  end
end
