require 'rails_helper'

RSpec.describe 'Item delete', type: :request do
  let!(:item) {FactoryBot.create(:item)}

  before {delete "/api/v1/items/#{item.id}"}

  it 'can update a current item' do
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
