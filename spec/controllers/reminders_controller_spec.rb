require 'rails_helper'

RSpec.describe RemindersController, type: :controller do
  describe 'GET index' do
    it 'returns ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
