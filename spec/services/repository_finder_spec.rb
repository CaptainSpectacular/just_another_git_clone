require 'rails_helper'

describe RepositoryFinder do
  subject{ RepositoryFinder.new(create(:user))}
  describe 'creation' do
    it 'can be made' do
      expect(subject).to be_a(RepositoryFinder)
    end
  end

  describe 'instance_methods' do
    it '#repositories' do
      VCR.use_cassette('user_repositories') do
        expect(subject.repositories.first).to be_a(Repository)
      end
    end
  end
end
