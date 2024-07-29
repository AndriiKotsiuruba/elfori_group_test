require 'rails_helper'

RSpec.describe 'Plates' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/plate/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/plate/show'
      expect(response).to have_http_status(:success)
    end
  end
end
