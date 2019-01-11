Dado("que o usuário acesse a tela de Incluir Contas Auxiliares") do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Conta Auxiliar')
end

Quando("o usuário preencher os campos obrigatórios de Contas Auxiliares") do
  mantercontaaux.preencherCampos
end

Dado("que o usuário pesquise uma Conta Auxiliar {string}") do |status|
  mantercontaaux.filtrarContaAux(status)
end

Então("o sistema deverá exibir a tela de detalhamnento da Conta Auxiliar") do
  page.assert_text('Detalhar Conta Auxiliar')
  mantercontaaux.verificarDetalhamento
end

Quando("acessar a tela de alteração de Conta Auxiliar") do
  mantercontaaux.acessarCA
  page.assert_text('Alterar Conta Auxiliar')
end

Quando("realizar a alteração da Conta Auxiliar") do
  mantercontaaux.alterarCA
end

Quando("realizar a exclusão do registro de Conta Auxiliar") do
  mantercontaaux.excluirCA
  botoes.clickButtonExcluir
  botoes.clickButtonSim
end