require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :role }
  end

  it 'defaults to a regular (non-admin) user' do
    user = User.create
    expect(user.role).to eq('user')
  end
end
