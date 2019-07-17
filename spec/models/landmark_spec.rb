require 'spec_helper'
require './app/models/landmark'

describe Landmark do
  let(:attribute) {
    {
    "geometry": {
      "location": {
        "lat": 39.7320329,
        "lng": -104.9617885
      },
      "viewport": {
        "northeast": {
          "lat": 39.7347054,
          "lng": -104.95759045
          },
        "southwest": {
          "lat": 39.72968899999999,
          "lng": -104.96318785
        }
      }
    },
    "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_recreational-71.png",
    "id": "27c5128df6a9a92604683c6ac7986a68043dc5b8",
    "name": "Denver Botanic Gardens",
    "opening_hours": {
      "open_now": false
    },
    "photos": [
      {
      "height": 2592,
      "html_attributions": [
      "<a href=\"https://maps.google.com/maps/contrib/111275340364491486041/photos\">Tulio Guerra</a>"
      ],
      "photo_reference": "CmRaAAAAcCf5in3sY2k96cJlyq5oOJrzIthIVk6frFyJAvY_EeosCYekBHyk1BU-5LnoU9d4jGhGTGM7VKmbwZjoXtWJ5wuep9QzjW7654F-G56hhoR14slOA2dtq_zNnQTDloxbEhAKmKuVBHc8R4hSk58eL6StGhQZoLDQeI1KBl2v12tTys8JursGvA",
      "width": 4608
      }
    ],
    "place_id": "ChIJ14cW_Ld-bIcRlAMkBe6SCV0",
    "plus_code": {
      "compound_code": "P2JQ+R7 Denver, Colorado, United States",
      "global_code": "85FQP2JQ+R7"
    },
    "rating": 4.8,
    "reference": "ChIJ14cW_Ld-bIcRlAMkBe6SCV0",
    "scope": "GOOGLE",
    "types": [
      "museum",
      "park",
      "point_of_interest",
      "establishment"
    ],
    "user_ratings_total": 9871,
    "vicinity": "1007 York Street, Denver"
    }
  }

  subject { Landmark.new(attribute) }

  it "exists" do
    expect(subject).to be_a Landmark
    expect(subject.name).to eq "Denver Botanic Gardens"
    expect(subject.rating).to eq 4.8
    expect(subject.types).to eq ["museum", "park", "point_of_interest", "establishment"]
    expect(subject.lat).to eq 39.7320329
    expect(subject.lng).to eq -104.9617885
    expect(subject.place_id).to eq "ChIJ14cW_Ld-bIcRlAMkBe6SCV0"
  end
end
