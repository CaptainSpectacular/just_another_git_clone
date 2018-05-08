require 'rails_helper'

describe DashboardController, type: :controller do
  describe 'endpoints' do
    it 'has index' do
      get :index

      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end
end
