# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Viewing, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  #TODO Look into factorybot - creates models that are backed by the database to use to test against
  # before(:each) do
  #   @user = {id: 1, email: 'tester@gmail.com', password: 'testingthis', password_confirmation: 'testingthis', username: 'Ardvaark',
  #            first_name: 'Jeffy', last_name: 'Tester', words_to_live_by: 'testing', age: 1, location: 'Brooklyn' }
  # end
  #
  # subject do
  #   Viewing.new(id: 1, status: 'not_started', note: 'I love this show', tmdb_id: 124900, progress: 0,
  #               user_id: @user[:id], created_at: DateTime.now, updated_at: DateTime.now)
  # end
  let(:viewing) { FactoryBot.create(:viewing) }

  it 'is valid with valid attributes' do
    expect(viewing).to be_valid
  end

  it 'is not valid without a status' do
    viewing.status = nil
    expect(viewing).to_not be_valid
  end
  it 'is not valid without a tmdb_id' do
    viewing.tmdb_id = nil
    expect(viewing).to_not be_valid
  end

  #TODO This pass fails because for some reason progress is nil. Figure out why progress is nil to get this test to pass
  it 'is not valid without progress' do
    viewing.progress = nil
    expect(viewing).to_not be_valid
  end
  it 'is not valid without a user' do
    viewing.user_id = nil
    expect(viewing).to_not be_valid
  end


end