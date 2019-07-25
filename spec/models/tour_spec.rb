require 'rails_helper'

RSpec.describe Tour, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :tour_recordings }
    it { should have_many(:recordings).through(:tour_recordings) }
    it { should have_many(:landmarks).through(:recordings) }
  end

  describe 'instance methods' do
    it '#recordings_for_landmark' do
      tour = create(:tour)
      landmark = create(:landmark)
      recording = create(:recording, landmark: landmark)
      create(:recording, landmark: landmark)
      create(:tour_recording, tour: tour, recording: recording)

      expect(tour.recordings_for_landmark(landmark)).to eq([recording])
    end
  end
end
