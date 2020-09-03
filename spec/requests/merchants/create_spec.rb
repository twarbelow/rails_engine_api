require 'rails_helper'

RSpec.describe 'Merchants create', type: :request do
  let!(:merchant) {FactoryBot.create(:merchant)}
  let!(:params) do
    {
      name: merchant.name,
    }
  end

  before {post '/api/v1/merchants', params: params}

  it 'can create a new merchant' do
    expect { post "/api/v1/merchants", params: params }.to change(Merchant, :count).by(+1)
  end

  it 'returns status code 201' do
    expect(response).to have_http_status(:created)
  end
end
