require 'rails_helper'

RSpec.describe Landmark, type: :model do
  describe 'validations' do
    it { should validate_presence_of :lat }
    it { should validate_presence_of :long }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :category }
  end
end
