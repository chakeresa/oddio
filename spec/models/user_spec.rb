require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_one :app_auth }
    it { should have_one :google_auth }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:display_name).case_insensitive }
    it { should validate_presence_of :display_name }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :role }
  end

  it 'defaults to a regular (non-admin) user' do
    user = User.create
    expect(user.role).to eq('user')
  end
end
