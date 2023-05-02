require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject do
    User.new(email: 'tester@gmail.com', password: 'testingthis', password_confirmation: 'testingthis', username: 'Ardvaark',
             first_name: 'Jeffy', last_name: 'Tester', words_to_live_by: 'testing', age: 1, location: 'Brooklyn')
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


end
