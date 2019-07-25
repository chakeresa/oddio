require 'rails_helper'

RSpec.describe TourRecording, type: :model do
  describe 'relationships' do
    it { should belong_to :tour }
    it { should belong_to :recording }
  end
end
