require 'rails_helper'

RSpec.describe 'Merchant index', type: :request do
  let!(:items) {FactoryBot.create_list(:merchant, 5)}

  before {get '/api/v1/merchants'}

  it 'can get all the merchants' do
    expect(JSON.parse(response.body)['data'].size).to eq(5)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
