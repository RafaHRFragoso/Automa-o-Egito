# INCLUIR

Dado('que eu acesse a tela de Incluir Grupo de Conta Auxiliar') do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Grupo de Conta Auxiliar')
end

Quando('o usuário preencher os campos obrigatórios de Grupo de Conta Auxiliar') do
  mantergrupocontaaux.incluirGCA
end

Quando('Salvar o registro') do
  botoes.clickButtonSalvar
end

Então('a operação deverá ser realizada com sucesso') do
  expect(page).to have_css('.ui-growl-message-success')
end

# DETALHAR

Dado('que o usuário pesquise um registro previamente incluido') do
  page.assert_text('Grupo de Conta Auxiliar')
  mantergrupocontaaux.pesquisarGCA(@status_scenario)
end

Quando('detalhar o registro escolhido') do

  botoes.clickButtonDetalhar
end

Então('o sistema deverá exibir a tela de detalhamento do Grupo de Conta Auxiliar') do
  page.assert_text('Detalhar Grupo de Conta Auxiliar')
  mantergrupocontaaux.validarDetalharGCA
  # FALTA IMPLEMENTAR VALIDAÇÕES DE DETALHAMENTO
end

# ALTERAR

Dado('acessar a tela de alteração de Grupo de Conta Auxiliar') do
  botoes.clickButtonAlterar
  page.assert_text('Alterar Grupo de Conta Auxiliar')
end

Quando('realizar as alteração do Grupo de Conta Auxiliar') do
  mantergrupocontaaux.alterarGCA
end

# EXCLUIR

Quando('realizar a exclusão do registro') do
  botoes.clickButtonExcluir
  mantergrupocontaaux.confirmExclusao
end
