require 'rails_helper'

describe "Landmarks API" do
  it "sends a list of customers" do
    create_list(:landmark, 3)

    get '/api/v1/landmarks'
    expect(response).to be_successful

     items = JSON.parse(response.body)
     
     expect(items['data'].count).to eq(3)
  end

  it "can get one item by id" do
   id = create(:customer).id
   get "/api/v1/customers/#{id}"
   customer = JSON.parse(response.body)
   expect(response).to be_successful
   expect(customer['data']["id"].to_i).to eq(id)
 end
end
