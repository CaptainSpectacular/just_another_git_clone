class Commit
  attr_reader :author, :author_url, :date

  def initialize(hash)
    @author     = hash[:author][:login]
    @author_url = hash[:author][:url]
    @date       = hash[:commit][:author][:date]
  end
end
