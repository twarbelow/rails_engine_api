require 'rails_helper'

RSpec.describe 'Item update', type: :request do
  let!(:item) {FactoryBot.create(:item)}
  let!(:params) do
    {
      name: 'Pickle',
      description: 'pickled cucumber',
      unit_price: 0.75,
      merchant_id: item.merchant_id
    }
  end

  before {patch "/api/v1/items/#{item.id}", params: params}

  it 'can update a current item' do
    expect(JSON.parse(response.body)['data']['id'].to_i).to eq(item.id)
    expect(JSON.parse(response.body)['data']['attributes']['name']).to eq('Pickle')
    expect(JSON.parse(response.body)['data']['attributes']['description']).to eq('pickled cucumber')
    expect(JSON.parse(response.body)['data']['attributes']['merchant_id']).to eq(item.merchant_id)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
