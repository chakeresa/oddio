require 'spec_helper'
require './app/models/landmark'

describe Landmark do
  let(:attribute) {
    {
      "type": "POI",
      "id": "US/POI/p1/2411719",
      "score": -0.12444,
      "dist": 124.44127109929306,
      "info": "search:ta:840049001001659-US",
      "poi": {
        "name": "Tucson Children's Museum",
        "phone": "+(1)-(520)-7929985",
        "categorySet": [
            {
                "id": 7317
            }
        ],
        "url": "www.tucsonchildrensmuseum.org",
        "categories": [
            "museum"
        ],
        "classifications": [
          {
            "code": "MUSEUM",
            "names": [
              {
                "nameLocale": "en-US",
                "name": "museum"
              }
            ]
          }
        ]
      },
      "address": {
        "streetName": "W Broadway Blvd",
        "municipalitySubdivision": "Tucson, Downtown Tucson",
        "municipality": "Tucson",
        "countrySecondarySubdivision": "Pima",
        "countryTertiarySubdivision": "Tucson",
        "countrySubdivision": "AZ",
        "postalCode": "85701",
        "extendedPostalCode": "857011606",
        "countryCode": "US",
        "country": "United States",
        "countryCodeISO3": "USA",
        "freeformAddress": "W Broadway Blvd, Tucson, AZ 85701",
        "localName": "Tucson",
        "countrySubdivisionName": "Arizona"
      },
      "position": {
        "lat": 32.22097,
        "lon": -110.972
      },
      "viewport": {
        "topLeftPoint": {
          "lat": 32.22187,
          "lon": -110.97306
        },
        "btmRightPoint": {
          "lat": 32.22007,
          "lon": -110.97094
        }
      },
      "entryPoints": [
        {
          "type": "main",
          "position": {
            "lat": 32.22099,
            "lon": -110.972
          }
        }
      ]
    }
  }

  subject { Landmark.new(attribute) }

  it "exists" do
    expect(subject).to be_a Landmark
    expect(subject.name).to eq "Tucson Children's Museum"
    expect(subject.types).to eq ['museum']
    expect(subject.lat.round(2)).to eq 32.22097.round(2)
    expect(subject.lng.round(2)).to eq -110.972.round(2)
  end
end
