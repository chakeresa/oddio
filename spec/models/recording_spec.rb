require 'rails_helper'

RSpec.describe Recording, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of :url }
  end
end
