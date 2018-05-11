require 'rails_helper'

describe MasterService do
  describe 'instance methods' do
    subject{MasterService.new}
    it '#conn' do
      expect(subject.send(:conn)).to be_a(Faraday::Connection)
      expect(subject.send(:conn).url_prefix.to_s).to include('https://api.github.com')
    end
  end
end
