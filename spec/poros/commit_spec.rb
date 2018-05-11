require 'spec_helper'

describe Commit do
  let(:attrs) { {commit: { author: { login: 'pollockcl', date: '12/12/12' },
                                     },
                 author: { url: '123ezpz' }}
              }

  subject{ Commit.new(attrs) }
  describe 'creation' do
    it 'can be made' do
      expect(subject).to be_a (Commit) 
    end

    it 'has attr_reader' do
      expect(subject.author).to eq('pollockcl')
      expect(subject.author_url).to eq('123ezpz')
      expect(subject.date).to eq('12/12/12') 
    end
  end

end
