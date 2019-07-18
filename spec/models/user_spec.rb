require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :username}
    it { should validate_uniqueness_of(:username).case_insensitive }
    it {should validate_presence_of :role}
    it {should validate_presence_of :password_digest}
  end

  it 'defaults to a regular (non-admin) user' do
    user = User.create(username: 'bobby', password: 'password')
    expect(user.role).to eq('user')
  end
end
