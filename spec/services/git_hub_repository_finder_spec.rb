require 'rails_helper'

describe GitHubRepositoryFinder do
  subject{ GitHubRepositoryFinder.new('pollockcl') }

  describe 'creation' do
    it 'can be made' do
      expect(subject).to be_a(GitHubRepositoryFinder)
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
