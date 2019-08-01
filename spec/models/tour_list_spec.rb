require 'spec_helper'
require './app/models/tour_list'

RSpec.describe TourList, type: :model do

  let(:subject) { TourList.new({'1' => 1, '2' => 1}) }
  let(:landmark1) { create(:landmark) }
  let(:landmark2) { create(:landmark) }
  let(:tour) { TourList.new({"#{landmark1.id}" => 1, "#{landmark2.id}" => 1}) }

  describe '#total_count' do
    it 'calculates the total number of landmarks it holds' do
      expect(subject.total_count).to eq(2)
    end
  end

  describe '#count_of' do
    it 'returns the count of all landmarks in the cart' do
      expect(subject.count_of(1)).to eq(1)
    end
  end

  describe '#add_landmark' do
    it 'adds a landmark to its contents' do
      subject.add_landmark(3)

      expect(subject.contents).to eq({'1' => 1, '2' => 1, '3' => 1})
    end

    it 'unable to increase contents greater than one' do
      subject.add_landmark(2)

      expect(subject.contents).to eq({'1' => 1, '2' => 1})
    end
  end

  describe '#remove_landmark' do
    it 'removes a landmark to its contents' do
      subject.remove_landmark(2)

      expect(subject.contents).to eq({'1' => 1})
    end

    it 'unable to decrease contents less than zero' do
      subject.remove_landmark(3)

      expect(subject.contents).to_not eq({'1' => 1, '2' => 1, '3' => -1})
      expect(subject.contents).to eq({'1' => 1, '2' => 1})
    end
  end

  describe '#load_landmarks' do
    it 'loads landmarks in an array' do
      expect(tour.landmarks).to eq([landmark1, landmark2])
    end
  end
end
