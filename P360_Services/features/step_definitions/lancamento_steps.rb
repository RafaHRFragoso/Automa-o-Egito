# CADASTRAR

Quando("realizar uma requisição para cadastrar um lançamento") do
  @response = @lancamento.incluir_lancamento(@asserts[:token])
  puts @asserts[:token]
end

Então("irá retornar dados válidos para o lançamento") do
  @lanc = @lancamento.validar_incluir_lancamento
  puts @lanc
  expect(@lanc[:sTipo]).to eql("success")
  expect(@lanc[:sMensagem]).to eql("Incluído com sucesso")  
end

# CONSULTAR

Quando("realizar uma requisição para consultar um lançamento") do
  # puts @lanc[:sTipo]
  # puts @lanc[:sMensagem]
  # puts @lanc[:cod_lanc]
  # puts @lanc[:grupo_lanc]
  # puts @asserts[:token]

  # @response = @lancamento.consultar_lancamento(@asserts[:token], @lanc[:cod_lanc])
  pending # Write code here that turns the phrase above into concrete actions
end

Então("irá retornar dados válidos para a consulta do lançamento") do
  pending # Write code here that turns the phrase above into concrete actions
end

# ALTERAR

Quando("realizar uma requisição para alterar um lançamento") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("irá retornar dados válidos para a alteração do lançamento") do
  pending # Write code here that turns the phrase above into concrete actions
end

# EXCLUIR

Quando("realizar uma requisição para excluir um lançamento") do
  # @lanc = @lancamento.pegar_lancamento
  # puts @lanc[:cod_lanc]
  @response = @lancamento.excluir_lancamento(@asserts[:token])
end

Então("irá retornar dados válidos para a exclusão do lançamento") do
  @lanc = @lancamento.validar_excluir_lancamento
  expect(@lanc[:sTipo]).to eql("success")
  expect(@lanc[:sMensagem]).to eql("Excluído com sucesso")  
end

