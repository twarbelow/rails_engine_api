require 'rails_helper'

RSpec.describe 'Items create', type: :request do
  let!(:item) {FactoryBot.create(:item)}
  let!(:params) do
    {
      data: {
        type: 'item',
        attributes: {
          name: item.name,
          description: item.description,
          unit_price: item.unit_price,
          merchant_id: item.merchant_id
        }
      }
    }
  end

  before {post '/api/v1/items', params: params}

  it 'can create a new item' do
    expect { post "/api/v1/items", params: params }.to change(Item, :count).by(+1)
  end

  it 'returns status code 201' do
    expect(response).to have_http_status(:created)
  end
end
