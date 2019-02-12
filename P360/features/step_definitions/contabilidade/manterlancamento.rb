# INCLUIR MAIS DE UM IGUAL

Dado("que o usuário acesse a tela de Incluir Lancamento") do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Lançamentos Contábeis') 
end

Quando("o usuario incluir mais de um credito e debito Iguais") do
  manterlancamento.incluirLC(@scenario_name)
end

# INCLUIR UNICO DIFERENTE
Quando("o usuario incluir um credito diferente de um debito") do
  manterlancamento.incluirLC(@scenario_name)
end

Então("o sistema deverá mostrar uma mensagem de erro") do
  expect(page).to have_css('.ui-growl-message-error')
end

# INCLUIR MAIS DE UM DIFERENTE
Quando("o usuario incluir mais de um credito e debito Diferentes") do
  manterlancamento.incluirLC(@scenario_name)
end


# DETALHAR

Dado("que o usuário pesquise um Lançamento previamente incluido") do
  botoes.clickButtonVoltar
  manterlancamento.pesquisarLC(@status_scenario)
end

Então("o sistema deverá exibir o detalhamento do Lançamento") do
  page.assert_text('Detalhar Lançamentos Contábeis')
  @campoValores = manterlancamento.validarDetalharLC
  expect(@campoValores[:campoValorDebito]).to eql(@campoValores[:valorDebito])
  expect(@campoValores[:campoValorDebito2]).to eql(@campoValores[:valorDebito2])
  expect(@campoValores[:campoValorCredito]).to eql(@campoValores[:valorCredito])
  expect(@campoValores[:campoValorCredito2]).to eql(@campoValores[:valorCredito2])
  expect(@campoValores[:campoValorCredito3]).to eql(@campoValores[:valorCredito3])
  expect(@campoValores[:valorDebitoTotal]).to eql(@campoValores[:campoValorDebitoTotal])
  expect(@campoValores[:valorCreditoTotal]).to eql(@campoValores[:campoValorCreditoTotal])
  expect(@campoValores[:campoDocumentoTela]).to eql(@campoValores[:campoDocumento])
  expect(@campoValores[:campoComplementoCreditoTela]).to eql(@campoValores[:campoComplementoCredito])
  expect(@campoValores[:campoComplementoDebitoTela]).to eql(@campoValores[:campoComplementoDebito])
end

# ALTERAR

Dado("acessar a tela de alteração do Lançamento") do
  botoes.clickButtonAlterar
  page.assert_text('Alterar Lançamentos Contábeis')
end

Quando("realizar a alteração do Lançamento") do 
  manterlancamento.alterarLC
end 

# EXCLUIR
# Função de excluir está sendo usada a de GRUPO DE CONTA AUXILIAR