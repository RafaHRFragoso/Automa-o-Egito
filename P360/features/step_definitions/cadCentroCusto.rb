Dado('que eu acesse a tela de Incluir Centro de Custo') do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Centro de Custo')
end

# INCLUIR
Quando('o usuário preencher os campos obrigatórios do Cadastro de Centro de Custo') do
  cadcentrocusto.preencherCampos
  sleep 5
end
