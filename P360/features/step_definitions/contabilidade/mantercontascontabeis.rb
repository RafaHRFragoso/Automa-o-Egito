# INCLUIR

Dado("que o usuário acesse a tela de Incluir Contas Contábeis") do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Contas Contábeis')
  puts @scenario_name
end

Quando("o usuário preencher os campos obrigatórios de Contas Contábeis") do
  mantercontacontabil.incluirCC(@scenario_name)
end

# DETALHAR

Dado("que o usuário pesquise uma Conta Contábil previamente incluida") do
  botoes.clickButtonVoltar
  mantercontacontabil.pesquisarCC(@status_scenario)
end

Então("o sistema deverá exibir a tela de detalhamnento da Conta Contábil") do
  page.assert_text('Detalhar Contas Contábeis')
  @camposValoresConta = mantercontacontabil.validarDetalharCC
  expect(@camposValoresConta[:campoConta]).to eql(@camposValoresConta[:contaInclusao])
  expect(@camposValoresConta[:campoDescricao]).to eql(@camposValoresConta[:descicaoInclusao])
end

# ALTERAR

Dado("acessar a tela de alteração de Conta Contábil") do
  botoes.clickButtonAlterar
  page.assert_text('Alterar Contas Contábeis')
end

Quando("realizar a alteração da Conta Contábil") do
  mantercontacontabil.alterarCC
end

# EXCLUIR
# Função de excluir está sendo usada a de GRUPO DE CONTA AUXILIAR

# ASSOCIAR / DESASSOCIAR CENTROS DE CUSTO A CONTA CONTABIL

Dado("que o usuário pesquise uma Conta Contábil para ser associada") do
  # botoes.clickButtonLimpar
  mantercontacontabil.pesquisarCC('associar')
end

Dado("acessar a tela de Associação de Centros de Custo a Conta Contábil") do
  botoes.clickButtonAssociarCentroCusto
  page.assert_text('Associação de Centros de Custo a Conta Contábil')
end

Quando("realizar a associação do Centro de Custo com a Conta Contábil") do
  mantercontacontabil.associarCentroCustoConta
end

Quando("realizar a desassociação do Centro de Custo com a Conta Contábil") do
  mantercontacontabil.desassociarCentroCustoConta
end

# COPIAR CONTA CONTABIL

Dado("que o usuário pesquise uma Conta Contábil para ser copiada") do
  mantercontacontabil.pesquisarCC('copiar')
end

Dado("acessar a tela de Copiar de Conta Contábil") do
  # page.find('.ui-splitbutton-menubutton').click
  botoes.clickSplitButton
  click_link 'Copiar Conta Contabil'
  page.assert_text('Copiar Conta Contabil')
end

Quando("realizar a copia da Conta Contábil") do
  mantercontacontabil.copiarCC
end

