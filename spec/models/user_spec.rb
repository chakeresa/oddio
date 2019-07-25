require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_one :app_auth }
    it { should have_one :google_auth }
    it { should have_many :recordings}
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
    user = User.create(email: "email", display_name: "display_name", first_name: "first_name")
    expect(user.role).to eq('user')
  end

  it 'adds a vote token upon creation' do
    user = User.create(email: "email", display_name: "display_name", first_name: "first_name")
    expect(user.vote_token).to_not eq(nil)
  end
end
