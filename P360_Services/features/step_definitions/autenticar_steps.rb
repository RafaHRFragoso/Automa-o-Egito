Quando("realizar uma requisição para autenticar usuário") do
  @response = @autenticar.post_autenticar
end

Então("a API irá retornar o status de sucesso na requisição") do
  @status_request = @response.success?
  expect(@status_request).to eq true
end

Então("irá retornar dados válidos para a requisição") do
  @asserts = @autenticar.validar_login

  expect(@asserts[:sTipo]).eql?("success")
  expect(@asserts[:sMensagem]).eql?("Autenticação realizada com sucesso.")

  # puts "Status da autenticação: #{@asserts[:sTipo]}"
  # puts "Mensagem da autenticação: #{@asserts[:sMensagem]}"
  # puts "Token da autenticação: #{@asserts[:token]}"
end

Quando("realizar a autenticação com {string} e {string}") do |user, password|
  @response = @autenticar.post_autenticar_failed(user,password)
end

Então("irá retornar o {string} e {string} da autenticação") do |status, mensagem|
  @asserts = @autenticar.validar_login
  expect(@asserts[:sTipo]).eql?(status)
  expect(@asserts[:sMensagem]).eql?(mensagem)  
end