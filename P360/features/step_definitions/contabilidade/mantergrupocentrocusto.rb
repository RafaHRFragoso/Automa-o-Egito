# INCLUIR

Dado("que eu acesse a tela de Incluir Grupo de Centro de Custo") do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Grupo de Centro de Custo')
end

Quando("o usuário preencher os campos obrigatórios de Grupo de Centro de Custo") do
  mantergrupocentrocusto.incluirGCC
end

# DETALHAR

Dado("que o usuário pesquise um grupo de centro de custo previamente incluido") do
  botoes.clickButtonVoltar
  mantergrupocentrocusto.pesquisarGCC
end

Então("o sistema deverá exibir a tela de detalhamento do Grupo de Centro de Custo") do
  page.assert_text('Detalhar Grupo de Centro de Custo')
  @campoValores = mantergrupocentrocusto.validarDetalharGCC
  expect(@campoValores[:campoCodigo]).to eql(@campoValores[:codigoGCC])
  expect(@campoValores[:campoDescricao]).to eql(@campoValores[:descricaoGCC])
  expect(@campoValores[:campoCentroCusto]).to eql(@campoValores[:centroCusto])
end

# ALTERAR

Dado("acessar a tela de alteração de Grupo de Centro de Custo") do
  botoes.clickButtonAlterar
  page.assert_text('Alterar Grupo de Centro de Custo')
end

Quando("realizar as alterações do Grupo de Centro de Custo") do
  mantergrupocentrocusto.alterarGCC
end

# EXCLUIR
# Função de excluir está sendo usada a de GRUPO DE CONTA AUXILIAR