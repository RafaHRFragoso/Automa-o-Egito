# INCLUIR

Dado("que o usuário acesse a tela de Incluir Tipo de Lançamento") do
botoes.clickButtonIncluir
page.assert_text('Incluir Tipo de Lançamento')
end

Quando("o usuário preencher os campos obrigatórios de Tipo de Lançamento") do
  mantertipolancamento.incluirTL
end

# DETALHAR

Dado("que o usuário pesquise um Tipo de Lançamento previamente incluido") do
  botoes.clickButtonVoltar
  mantertipolancamento.pesquisarTL(@status_scenario)
end

Quando("detalhar o registro de lancamento escolhido") do
  botoes.clickButtonDetalhar
end

Então("o sistema deverá exibir o detalhamento do Tipo de Lançamento") do
  page.assert_text('Detalhar Tipo de Lançamento')
  @campoValores = mantertipolancamento.validarDetalharTL
  expect(@campoValores[:campoCodigo]).to eql(@campoValores[:codigoLancamento])
  expect(@campoValores[:campoDescricao]).to eql(@campoValores[:descricaoAntes])
end

# ALTERAR

Quando("acessar a tela de alteração de Tipo de Lançamento") do  
  botoes.clickButtonAlterar
  page.assert_text('Alterar Tipo de Lançamento')
end

Quando("realizar a alteração do Tipo de Lançamento") do
  mantertipolancamento.alterarTL
end

# EXCLUIR
# Função de excluir está sendo usada a de GRUPO DE CONTA AUXILIAR