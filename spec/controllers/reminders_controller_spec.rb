require 'rails_helper'

RSpec.describe RemindersController, type: :controller do
  describe 'GET index' do
    before(:all) do
      10.times do |i|
        Reminder.create!(title: i.to_s, text: i.to_s, date_of_issue: "1st November 2016".to_datetime, user_id: 1)
      end
    end

    it 'returns ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns json' do
      get :index
      expect(response.content_type).to eq('application/json')
    end
  end
end
