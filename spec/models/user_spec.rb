require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
  end

  describe 'class methods' do
    it 'from_omniauth' do
      request     = Struct.new(:uid, :info, :credentials)
      info        = Struct.new(:nickname)
      credentials = Struct.new(:token)
      auth        = request.new
      auth.info   = info.new
      auth.uid    = '12228'
      auth.credentials = credentials.new
      auth.info.nickname = 'BurbotsRevenge'
      auth.credentials.token = 'yay token'
      
      expect(User.all.size).to eq(0)
      
      User.from_omniauth(auth)
 
      expect(User.all.size).to eq(1)
      expect(User.first.username).to eq('BurbotsRevenge')
    end
  end
end
