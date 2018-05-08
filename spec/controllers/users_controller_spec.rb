require 'rails_helper'

describe UsersController, type: :controller do
  describe 'endpoints' do
    it '#show' do
      user = create(:user)
      get :show, params: { id: user.id }
        
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end
end
