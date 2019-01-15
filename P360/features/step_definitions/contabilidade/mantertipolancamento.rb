# INCLUIR

Dado("que o usuário acesse a tela de Incluir Tipo de Lançamento") do
botoes.clickButtonIncluir
page.assert_text('Incluir Tipo de Lançamento')
end

Quando("o usuário preencher os campos obrigatórios de Tipo de Lançamento") do
  mantertipolancamento.incluirTL
end

# DETALHAR

Dado("que o usuário pesquise um Tipo de Lançamento previamente {string}") do |status|
  mantertipolancamento.pesquisarTL(status)
end

Quando("detalhar o registro de lancamento escolhido") do
  mantertipolancamento.detalharTL  
end

Então("o sistema deverá exibir o detalhamento do Tipo de Lançamento") do
  page.assert_text('Detalhar Tipo de Lançamento')
  mantertipolancamento.validarInfoTL
end

# ALTERAR

Quando("acessar a tela de alteração de Tipo de Lançamento") do  
  botoes.clickButtonAlterar
end

Quando("realizar a alteração do Tipo de Lançamento") do
  mantertipolancamento.alterarTL
end

# EXCLUIR

Quando("realizar a exclusão do registro do Lançamento") do
  botoes.clickButtonExcluir
  botoes.clickButtonSim
end
