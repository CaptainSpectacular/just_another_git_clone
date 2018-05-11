class MasterService
  protected 

  def conn
    @conn ||= Faraday.new('https://api.github.com')
  end
  
  def raw_response(url, auth=false)
    conn.get do |req|
      req.headers['Authorization'] = 'token ' + @user.token if auth
      req.url url
    end.body
  end
end
