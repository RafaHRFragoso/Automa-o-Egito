# INCLUIR

Dado("que o usuário acesse a tela de Incluir Historico Padrão") do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Histórico Padrão')
end

Quando("o usuário preencher os campos obrigatórios de Historico Padrão") do
  manterhistoricopadrao.incluirHP
end

# DETALHAR

Dado("que o usuário pesquise um Historico Padrão previamente incluido") do
  botoes.clickButtonVoltar
  manterhistoricopadrao.pesquisarHP(@status_scenario)
end

Então("o sistema deverá exibir o detalhamento do Historico Padrão pesquisado") do
  page.assert_text('Detalhar Histórico Padrão')
  expect(page).to have_content("Automacao")
  @camposValores = manterhistoricopadrao.validarDetalharHP
  expect(@camposValores[:campoCodigo]).to eql(@camposValores[:valorCodigo])
  expect(@camposValores[:campoHistorico]).to eql(@camposValores[:valorHistorico])
end

# ALTERAR

Quando("acessar a tela de alteração de Historico Padrão") do
  botoes.clickButtonAlterar
  page.assert_text('Alterar Histórico Padrão')
end

Quando("realizar a alteração do Historico Padrão") do
  manterhistoricopadrao.alterarHP
end

# EXCLUIR
# Função de excluir está sendo usada a de GRUPO DE CONTA AUXILIAR