# frozen_string_literal: true
# user factory_bot
FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    username { 'mandomandoo' }
    email { 'test@gmail.com' }
    words_to_live_by { 'I love movies!' }
    password { 'testingthis'}
    age { 20 }
    location { 'brooklyn'}
  end
end
