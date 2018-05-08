require 'rails_helper' 

describe SessionsController, type: :controller do
  describe 'endpoints' do
    it '#create' do
      get :create

      expect(response).to redirect_to(:root)
    end
  end
end
