require 'rails_helper'

RSpec.describe GoogleAuth, type: :model do
  describe 'relationships' do
    it { should belong_to(:user).optional }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:uid) }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :token }
  end
end
