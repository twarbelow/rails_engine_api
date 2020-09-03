require 'rails_helper'

RSpec.describe 'Item show', type: :request do
  let!(:item) {FactoryBot.create(:item)}

  before {get "/api/v1/items/#{item.id}"}

  it 'can get all the items' do
    expect(JSON.parse(response.body)['data'].size).to eq(1)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
