require 'rails_helper'

describe CommitsFinder do
  subject{CommitsFinder.new('pollockcl', 'rails_engine')}

  describe 'creation' do
    it 'can be made' do
      expect(subject).to be_a(CommitsFinder)
    end
  end

  describe 'instance methods' do
    it '#commits' do
      VCR.use_cassette('repo_commits') do
        expect(subject.commits.first).to be_a(Commit)
      end
    end  
  end
end
