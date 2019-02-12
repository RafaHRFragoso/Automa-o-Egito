# INCLUIR

Dado("que o usuário acesse a tela de Incluir Conta por Centro de Custo e Conta Auxiliar") do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Conta por Centro de Custo e Conta Auxiliar')
end

Quando("o usuário preencher os campos obrigatórios da Conta por Centro de Custo e Conta Auxiliar") do
  mantercontaccustocontaaux.incluirCCCCA
end

# DETALHAR

Dado("que o usuário pesquise uma Conta por Centro de Custo e Conta Auxiliar previamente incluida") do
  botoes.clickButtonVoltar
  mantercontaccustocontaaux.pesquisarCCCCA
end

Então("o sistema deverá exibir a tela de detalhamento de Conta por Centro de Custo e Conta Auxiliar") do
  page.assert_text('Detalhar Conta por Centro de Custo e Conta Auxiliar')
  @camposValoresCCCCA = mantercontaccustocontaaux.validarDetalharCCCCA
  expect(@camposValoresCCCCA[:campoContaContabil]).to eql(@camposValoresCCCCA[:contaInicial])
  expect(@camposValoresCCCCA[:campoCentroCusto]).to eql(@camposValoresCCCCA[:centroCustoInicial])
  expect(@camposValoresCCCCA[:campoContaAuxiliar]).to eql(@camposValoresCCCCA[:contaAuxInicial])
end

# ALTERAR

Dado("acessar a tela de alteração de Conta por Centro de Custo e Conta Auxiliar") do
  botoes.clickButtonAlterar
  page.assert_text('Alterar Conta por Centro de Custo e Conta Auxiliar')
end

Quando("realizar a alteração da Conta por Centro de Custo e Conta Auxiliar") do
  mantercontaccustocontaaux.alterarCCCCA
end

# EXCLUIR
# Função de excluir está sendo usada a de GRUPO DE CONTA AUXILIAR