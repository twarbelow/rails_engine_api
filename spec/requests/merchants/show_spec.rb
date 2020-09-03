require 'rails_helper'

RSpec.describe 'Merchant show', type: :request do
  let!(:merchant) {FactoryBot.create(:merchant)}

  before {get "/api/v1/merchants/#{merchant.id}"}

  it 'can get individual merchant information' do
    expect(JSON.parse(response.body)['data']['id'].to_i).to eq(merchant.id)
    expect(JSON.parse(response.body)['data']['type']).to eq("merchant")
    expect(JSON.parse(response.body)['data']['attributes']['name']).to eq(merchant.name)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
