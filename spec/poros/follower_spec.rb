require 'spec_helper'

describe Follower do
  describe 'creation and attributes' do
    it 'can be made and has an attr_reader' do
      attrs = { login: 'pollockcl' }
      follower = Follower.new(attrs)

      expect(follower).to be_a(Follower)
      expect(follower.username).to eq('pollockcl')
    end
  end
end
