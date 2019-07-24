require 'rails_helper'

RSpec.describe Tour, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :tour_recordings }
    it { should have_many(:recordings).through(:tour_recordings) }
  end
end
