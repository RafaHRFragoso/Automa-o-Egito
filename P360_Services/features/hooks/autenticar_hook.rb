Before do

  @body = {
    'LOGIN' => CONFIG['user'],
    'SENHA' => CONFIG['password']
  }

  @base_url = CONFIG['base_url']
  @autenticar_url = 'wsSystem.asmx?WSDL'
  @url_service = @base_url + @autenticar_url

  @autenticar = Autenticar.new(@body, @url_service)

end