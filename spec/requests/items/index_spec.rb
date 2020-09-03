require 'rails_helper'

RSpec.describe 'Items index', type: :request do
  let!(:items) {FactoryBot.create_list(:item, 5)}

  before {get '/api/v1/items'}
  
  it 'can get all the items' do
    expect(JSON.parse(response.body)['data'].size).to eq(5)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
