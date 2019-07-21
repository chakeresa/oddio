require 'rails_helper'

RSpec.describe AppAuth, type: :model do
  describe 'relationships' do
    it { should belong_to(:user).optional }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_presence_of :username }
  end
end
