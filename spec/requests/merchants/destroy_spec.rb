require 'rails_helper'

RSpec.describe 'Merchant delete', type: :request do
  let!(:merchant) {FactoryBot.create(:merchant)}

  before {delete "/api/v1/merchants/#{merchant.id}"}

  it 'can update a current merchant' do
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
