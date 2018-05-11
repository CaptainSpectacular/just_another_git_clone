require 'rails_helper' 

describe GitHubUser do
  subject{ GitHubUser.new('pollockcl') }

  describe 'creation' do
    it 'can be made' do
      expect(subject).to be_a(GitHubUser)
      expect(subject.username).to eq('pollockcl')
    end
  end

  describe 'instance_methods' do
    it '#repositories' do
      VCR.use_cassette('user_repositories') do
        method = subject.repositories

        expect(method).to be_an(Array)
        expect(method.first).to be_a(Repository)
      end
    end 
  end
end
