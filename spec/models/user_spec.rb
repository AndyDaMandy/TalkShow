require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # TODO Tests are no longer passing with this subject. I added in things such as "role" and that seemed to make things worse
  subject do
    User.new(email: 'tester4@gmail.com', password: 'testingthis', password_confirmation: 'testingthis', username: 'Ardvaark',
             first_name: 'Jeffy', last_name: 'Tester', words_to_live_by: 'testing', age: 1, created_at: DateTime.now, updated_at: DateTime.now, location: 'Brooklyn')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a first_name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a last_name' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if the username is greater than 34 characters' do
    subject.username.length >= 35
    expect(subject).to_not be_valid
  end

  it 'is not valid if the username is less than 3 characters' do
    subject.username.length <= 2
    expect(subject).to_not be_valid
  end
  it 'is not valid if the age is less than 13' do
    subject.age < 13
    expect(subject).to_not be_valid
  end
  it 'is not valid if the age is greater than 100' do
    subject.age > 100
    expect(subject).to_not be_valid
  end


end
