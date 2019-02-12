# INCLUIR

Dado("que o usuário acesse a tela de Incluir Centro de Custo") do
  botoes.clickButtonIncluir
  page.assert_text('Incluir Centro de Custo')
end

Quando("o usuário preencher os campos obrigatórios do Centro de Custo") do
  mantercentrocusto.incluirCCusto(@scenario_name)
end

# DETALHAR

Dado("que o usuário pesquise um Centro de Custo previamente incluido") do
  botoes.clickButtonVoltar
  # ESTE É UM METODO TEMPORÁRIO E DEVERÁ SER EXCLUÍDO QUANDO RESLVER O PROBLEMA DE CARREGAR O 
  # ITEM INCLUIDO NO COMBO DE FILTRO APÓS CLICAR NO BOTÃO VOLTAR OU O SISTEMA PERMITIR 
  # NOVAMENTE RECARREGAR A PÁGINA OU ACESSAR A PAGINA DIRETAMENTE PELA URL
  mantercentrocusto.telaCCustoInicial
  mantercentrocusto.pesquisarCCusto(@status_scenario)  
end

Então("o sistema deverá exibir a tela de detalhamnento do Centro de Custo") do
  page.assert_text('Detalhar Centro de Custo')
  @camposValoresCCusto = mantercentrocusto.validarDetalharCCusto
  expect(@camposValoresCCusto[:campoDescricao]).to eql(@camposValoresCCusto[:descricaiCCusto])
  expect(@camposValoresCCusto[:campoHierarquia]).to eql(@camposValoresCCusto[:hierarquiaCCusto])
  expect(@camposValoresCCusto[:campoCodigo]).to eql(@camposValoresCCusto[:codigoCCusto])
end

# ALTERAR

Dado("acessar a tela de alteração de Centro de Custo") do
  botoes.clickButtonAlterar
  page.assert_text('Alterar Centro de Custo')
end

Quando("realizar a alteração do Centro de Custo") do
  mantercentrocusto.alterarCCusto
end

# EXCLUIR
# Função de excluir está sendo usada a de GRUPO DE CONTA AUXILIAR

# ASSOCIAR / DESASSOCIAR CONTA CONTABIL A CENTROS DE CUSTO

Dado("que o usuário pesquise um Centro de Custo para ser associado") do
  mantercentrocusto.pesquisarCCusto('associar')  
end

Dado("que o usuário pesquise um Centro de Custo para ser desassociado") do
  mantercentrocusto.pesquisarCCusto('desassociar')
end

Dado("acessar a tela de Associação de Contas ao Centro de Custo") do
  click_button 'Associar Contas'
  page.assert_text('Associação de Contas ao Centro de Custo')
end

Quando("realizar a associação da Conta com o Centro de Custo") do
  mantercentrocusto.associarContaCentroCusto
end

Quando("realizar a desassociação da Conta com o Centro de Custo") do
  mantercentrocusto.desassociarContaCentroCusto
end

# ASSOCIAR / DESASSOCIAR CENTRO DE CUSTO A GRUPOS DE CENTROS DE CUSTO

Dado("acessar a tela de Associação de Centro de Custo a Grupos de Centros de Custo") do
  botoes.clickSplitButton
  click_link 'Associar Grupos Cento de Custo'
  page.assert_text('Associação de Centro de Custo a Grupos de Centros de Custo')
end

Quando("realizar a associação do Centro de Custo com o Grupos de Centros de Custo") do
  mantercentrocusto.associarCCustoGrupoCCusto
end

Quando("realizar a desassociação do Centro de Custo com o Grupos de Centros de Custo") do
  mantercentrocusto.desassociarCCustoGrupoCCusto
end

