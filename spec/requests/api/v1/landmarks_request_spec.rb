require 'rails_helper'

describe "Landmarks API" do
  it "sends a list of landmarks" do
    create_list(:landmark, 3)

    get '/api/v1/landmarks'
    expect(response).to be_successful

     items = JSON.parse(response.body)gs
     expect(items['data'].count).to eq(3)

  end

  it "can get one landmark by id" do
  landmark = create(:landmark)
   id = landmark.id
   name = landmark.name
   lat = landmark.lat
   long = landmark.long
   category = landmark.category
   website = landmark.website
   photo_url = landmark.photo_url
   phone = landmark.phone
   address = landmark.address
   get "/api/v1/landmarks/#{id}"
   landmark = JSON.parse(response.body)
   expect(response).to be_successful
   expect(landmark['data']["id"].to_i).to eq(id)
   expect(landmark['data']['attributes']["name"]).to eq(name)
   expect(landmark['data']['attributes']["lat"]).to eq(lat)
   expect(landmark['data']['attributes']["long"]).to eq(long)
   expect(landmark['data']['attributes']["category"]).to eq(category)
   expect(landmark['data']['attributes']["phone"]).to eq(phone)
   expect(landmark['data']['attributes']["website"]).to eq(website)
   expect(landmark['data']['attributes']["photo_url"]).to eq(photo_url)
   expect(landmark['data']['attributes']["address"]).to eq(address)
 end
end
