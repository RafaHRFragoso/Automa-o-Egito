Dado('que eu acesse a tela de Incluir Grupo de Conta Auxiliar') do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Grupo de Conta Auxiliar')
end

# INCLUIR

Quando('o usuário preencher os campos obrigatórios') do
  # cadgrupocontaaux.preencher_Campos
  grupo1 = $grupo
  puts grupo1
  descricao1 = $descricao
  puts descricao1
  cadgrupocontaaux.grupoField.set(grupo1)
  cadgrupocontaaux.descricaoField.set(descricao1)
  # fill_in "grupo", with: grupo1
  # fill_in "descricao", with: descricao1
  # page.find(:label, "Controle Por Filial")
end

Quando('Salvar o registro') do
  botoes.clickButtonSalvar
end

Então('a operação deverá ser realizada com sucesso') do
  expect(page).to have_css('.ui-growl-message-success')
end

# DETALHAR

Quando('o usuário pesquisar um registro previamente incluido') do
  page.assert_text('Grupo de Conta Auxiliar')
  @descricaoFiltro = $descricaoFiltro
  # puts @descricaoFiltro
  cadgrupocontaaux.preencher_Filtros(@descricaoFiltro)
  botoes.clickButtonPesquisar
end

Quando('detalhar o registro escolhido') do
  page.find('tr > td > p-dtcheckbox > div > div.ui-chkbox-box.ui-widget.ui-corner-all.ui-state-default').click
  botoes.clickButtonDetalhar
end

Então('o sistema deverá exibir a tela de detalhamnento') do
  page.assert_text('Detalhar Grupo de Conta Auxiliar')
end

# ALTERAR

Quando('acessar a tela de alterar registro') do
  page.find('tr > td > p-dtcheckbox > div > div.ui-chkbox-box.ui-widget.ui-corner-all.ui-state-default').click
  botoes.clickButtonAlterar
  page.assert_text('Alterar Grupo de Conta Auxiliar')
end

Então('realizar as atlerações desejadas') do
  @novaDesc = Faker::StarWars.character
  puts @novaDesc
  cadgrupocontaaux.descricaoField.set(@novaDesc)
  $descricaoFiltro = @novaDesc
  puts $descricaoFiltro
end

# EXCLUIR

Quando('realizar a exclusão do registro') do
  page.find('tr > td > p-dtcheckbox > div > div.ui-chkbox-box.ui-widget.ui-corner-all.ui-state-default').click
  botoes.clickButtonExcluir
  cadgrupocontaaux.confirm_Exclusao
end
