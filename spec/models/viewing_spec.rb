require 'rails_helper'
#
# RSpec.describe Viewing, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"
#   # subject {}
# end
RSpec.describe Viewing, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  #TODO Look into factorybot - creates models that are backed by the database to use to test against
  before(:each) do
    @user = {id: 1, email: 'tester@gmail.com', password: 'testingthis', password_confirmation: 'testingthis', username: 'Ardvaark',
             first_name: 'Jeffy', last_name: 'Tester', words_to_live_by: 'testing', age: 1, location: 'Brooklyn' }
  end

  subject do
    Viewing.new(id: 1, status: 'not_started', note: 'I love this show', tmdb_id: 124900, progress: 0,
                user_id: @user[:id], created_at: DateTime.now, updated_at: DateTime.now)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a status' do
    subject.status = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a tmdb_id' do
    subject.tmdb_id = nil
    expect(subject).to_not be_valid
  end

  #TODO This pass fails because for some reason progress is nil. Figure out why progress is nil to get this test to pass
  it 'is not valid without progress' do
    subject.progress = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end


end