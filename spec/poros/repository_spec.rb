require 'rails_helper'

describe Repository do
  let(:repo_hash) {{ name: 'rails_engine',
                     url: 'batman.com',
                     owner: { login: 'pollockcl' }
                  }}

  describe 'attributes' do
    it 'has attr_readers' do
      repo = Repository.new(repo_hash)

      expect(repo.name).to eq(repo_hash[:name])
      expect(repo.url).to eq(repo_hash[:url])
      expect(repo.owner).to eq(repo_hash[:owner][:login])
      expect(repo).to be_a(Repository)
    end
    
    it 'can be created from manual params' do
      repo = Repository.from_params(repo: 'vlad', user_slug: 'me')

      expect(repo.name).to eq('vlad')
      expect(repo.owner).to eq('me')
      expect(repo).to be_a(Repository)
    end
  end

  describe 'instance methods' do
    subject{ Repository.new(repo_hash) }    

    it '#commits' do
      VCR.use_cassette('repo_commits') do
        expect(subject.commits.size).to eq(30) 
        expect(subject.commits.first).to be_a(Commit)
      end
    end
  end
end
