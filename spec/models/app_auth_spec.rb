require 'rails_helper'

RSpec.describe AppAuth, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_presence_of :username }
  end
end
