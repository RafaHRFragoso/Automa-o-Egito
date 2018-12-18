Before '@autenticar' do

  @body = {
    'LOGIN' => CONFIG['user'],
    'SENHA' => CONFIG['password']
  }

  # @body = JSON.generate(body)
  
  @url_service = CONFIG['url_service']

  @autenticar = Autenticar.new(@body, @url_service)

end