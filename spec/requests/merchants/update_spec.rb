require 'rails_helper'

RSpec.describe 'Merchant update', type: :request do
  let!(:merchant) {FactoryBot.create(:merchant)}
  let!(:params) do
    {
      name: 'PickleMan'
    }
  end

  before {patch "/api/v1/merchants/#{merchant.id}", params: params}

  it 'can update a current merchant' do
    expect(JSON.parse(response.body)['data']['id'].to_i).to eq(merchant.id)
    expect(JSON.parse(response.body)['data']['attributes']['name']).to eq('PickleMan')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
