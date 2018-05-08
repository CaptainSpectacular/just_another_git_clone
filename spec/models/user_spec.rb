require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
  end

  describe 'class methods' do
    it 'from_omniauth' do
      request   = Struct.new(:uid, :info)
      info      = Struct.new(:nickname)
      auth      = request.new
      auth.info = info.new
      auth.uid  = '12228'
      auth.info.nickname = 'BurbotsRevenge'
      
      expect(User.all.size).to eq(0)
      
      User.from_omniauth(auth)
  
      expect(User.all.size).to eq(1)
    end
  end
end
