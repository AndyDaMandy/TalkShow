require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # TODO Tests are no longer passing with this user. I added in things such as "role" and that seemed to make things worse
  # user do
  #   user = User.find_or_create_by(email: 'tester4@gmail.com', password: 'testingthis', password_confirmation: 'testingthis', username: 'Arrdvaark',
  #            first_name: 'Jeffy', last_name: 'Tester', words_to_live_by: 'testing', age: 1, created_at: DateTime.now, updated_at: DateTime.now, location: 'Brooklyn')
  #   # user = create(:user)
  # end
  # Use FactoryBot to create a user
  describe 'validations' do
    let(:user) { FactoryBot.create(:user) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end
    it 'is not valid without a username' do
      user.username = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a first_name' do
      user.first_name = nil
      expect(user).to_not be_valid
    end
    it 'is not valid without a last_name' do
      user.last_name = nil
      expect(user).to_not be_valid
    end
    it 'is not valid if the username is greater than 34 characters' do
      user.username.length >= 35
      expect(user).to_not be_valid
    end

    it 'is not valid if the username is less than 3 characters' do
      user.username.length <= 2
      expect(user).to_not be_valid
    end
    it 'is not valid if the age is less than 13' do
      user.age < 13
      expect(user).to_not be_valid
    end
    it 'is not valid if the age is greater than 100' do
      user.age < 100
      expect(user).to_not be_valid
    end
  end



end
