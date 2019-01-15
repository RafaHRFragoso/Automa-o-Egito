# INCLUIR

Dado("que o usuário acesse a tela de Incluir Historico Padrão") do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Histórico Padrão')
end

Quando("o usuário preencher os campos obrigatórios de Historico Padrão") do
  manterhistoricopadrao.incluirHP
end

# DETALHAR

Dado("que o usuário pesquise um Historico Padrão {string}") do |status|
  manterhistoricopadrao.pesquisarHP(status)
end

# Quando("detalhar o registro escolhido do Historico Padrão") do
#   manterhistoricopadrao.detalharHP
# end

Então("o sistema deverá exibir o detalhamento do Historico Padrão pesquisado") do
# Então("o sistema deverá exibir a tela de detalhamento de Historico Padrão") do
  page.assert_text('Detalhar Histórico Padrão')
  expect(page).to have_content("Automacao")
  @campos = manterhistoricopadrao.verificarInfo
  puts @campos
  expect(@campos[:campoCodigo]).to eql($valorCodigoDetalhar)
  expect(@campos[:campoHistorico]).to eql($valorHistoricoDetalhar)  
end

# ALTERAR

Quando("acessar a tela de alteração de Historico Padrão") do
  manterhistoricopadrao.selecionarAlterarHP
  page.assert_text('Alterar Histórico Padrão')
end

Quando("realizar a alteração do Historico Padrão") do
  manterhistoricopadrao.alterarHP
end

# EXCLUIR

Quando("realizar a exclusão do Historico Padrão") do
  manterhistoricopadrao.excluirHP
  botoes.clickButtonExcluir
  botoes.clickButtonSim
end