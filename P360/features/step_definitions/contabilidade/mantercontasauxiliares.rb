# INCLUIR

Dado("que o usuário acesse a tela de Incluir Contas Auxiliares") do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Conta Auxiliar')
end

Quando("o usuário preencher os campos obrigatórios de Contas Auxiliares") do
  mantercontaaux.incluirCA
end

# DETALHAR

Dado("que o usuário pesquise uma Conta Auxiliar previamente incluida") do
  botoes.clickButtonVoltar
  mantercontaaux.pesquisarCA(@status_scenario)
end

Então("o sistema deverá exibir a tela de detalhamnento da Conta Auxiliar") do
  page.assert_text('Detalhar Conta Auxiliar')
  @campoValores = mantercontaaux.validarDetalharCA
  expect(@campoValores[:campoCodigo]).to eql(@campoValores[:codigoPesquisa])
  expect(@campoValores[:campoDescricao]).to eql(@campoValores[:descicaoInicial])
end

# ALTERAR

Quando("acessar a tela de alteração de Conta Auxiliar") do
  botoes.clickButtonAlterar
  page.assert_text('Alterar Conta Auxiliar')
end

Quando("realizar a alteração da Conta Auxiliar") do
  mantercontaaux.alterarCA
end

# EXCLUIR
# Função de excluir está sendo usada a de GRUPO DE CONTA AUXILIAR