require 'rails_helper'

RSpec.describe 'Item show', type: :request do
  let!(:item) {FactoryBot.create(:item)}

  before {get "/api/v1/items/#{item.id}"}

  it 'can get individual item information' do
    expect(JSON.parse(response.body)['data']['id'].to_i).to eq(item.id)
    expect(JSON.parse(response.body)['data']['type']).to eq("item")
    expect(JSON.parse(response.body)['data']['attributes']['name']).to eq(item.name)
    expect(JSON.parse(response.body)['data']['attributes']['description']).to eq(item.description)
    expect(JSON.parse(response.body)['data']['attributes']['merchant_id']).to eq(item.merchant_id)

  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
