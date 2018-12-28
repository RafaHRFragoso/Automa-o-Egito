Quando("realizar uma requisição para cadastrar um lançamento") do
  @response = @lancamento.incluir_lancamento(@asserts[:token])
end

Então("irá retornar dados válidos para o lançamento") do
  @lanc = @lancamento.validar_incluir_lancamento
  expect(@lanc[:sTipo]).eql?("success")
  expect(@lanc[:sMensagem]).eql?("Incluído com sucesso")  
end