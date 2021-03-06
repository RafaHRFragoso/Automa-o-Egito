# Before('@background_GCA') do
#   step 'que o usuário acesse a página inicial'
#   step 'o usuário realizar o login'
#   step 'deve ser autenticado com sucesso'
#   step 'selecionar a empresa "ICOM COMÉRCIO - SP"'
#   step 'acessar a tela de Grupos de Contas Auxiliares'
#   step 'o sistema deve exibir a tela de Grupos de Contas Auxiliares'
# end

# Before('@tela_GCA') do
#   visit '/contabilidade/grupocontaauxiliar'
# end

Before('@back_homepage') do
  step 'que o usuário acesse a página inicial'
  step 'o usuário realizar o login'
  step 'deve ser autenticado com sucesso'
  step 'selecionar a empresa "ICOM COMÉRCIO - SP"'
end

Before('@tela_GCA') do
  step 'acessar a tela de Grupos de Contas Auxiliares'
  step 'o sistema deve exibir a tela de Grupos de Contas Auxiliares'
end

# Before('@tela_GCA_fast') do
#   visit '/contabilidade/grupocontaauxiliar'
# end

Before('@tela_CA') do
  step 'acessar a tela de Contas Auxiliares'
  step 'o sistema deve exibir a tela de Contas Auxiliares'
end

# Before('@tela_CA_fast') do
#   visit '/contabilidade/contaauxiliar'
# end

Before('@tela_TL') do
  step 'acessar a tela de Tipo de Lançamento'
  step 'o sistema deve exibir a tela de Tipo de Lançamento'
end

# Before('@tela_TL_fast') do
#   visit '/contabilidade/lancamentotipo'
# end

Before('@tela_HP') do
  step 'acessar a tela de Histórico Padrão'
  step 'o sistema deve exibir a tela de Histórico Padrão'
end

# Before('@tela_HP_fast') do
#   visit '/contabilidade/historicopadrao'
# end

Before('@tela_CC') do
  step 'acessar a tela de Contas Contábeis'
  step 'o sistema deve exibir a tela de Contas Contábeis'
end
  
Before('@tela_LC') do
  step 'acessar a tela de Lançamento Normal'  
  step 'o sistema deve exibir a tela de Lançamento Normal'
end

Before('@tela_CCusto') do
  step 'acessar a tela de Centros de Custo'
  step 'o sistema deve exibir a tela de Centros de Custo'
end

Before('@tela_CCCCA') do
  step 'acessar a tela de Contas por Centro de Custo e Conta Auxilar'
  step 'o sistema deve exibir a tela de Contas por Centro de Custo e Conta Auxilar'
end

Before('@tela_GCC') do
  step 'acessar a tela de Grupos de Centro de Custo'
  step 'o sistema deve exibir a tela de Grupos de Centro de Custo'
end

Before do |scenario|
  @scenario_name = scenario.name
  @status_scenario = @scenario_name.include?("Excluir")
  case @status_scenario
  when true
    @status_scenario = 'excluir'
  when false
    @status_scenario = 'incluir'
  end
  @scenario_name
  @status_scenario
end

After ('@copiarCC') do                               
  step 'selecionar a empresa "AGROSSSSSSSSSSSSSSSSSSSSSSSSSSS"'
  step 'que o usuário pesquise uma Conta Contábil para ser copiada'
  step 'realizar a exclusão do registro'
  step 'a operação deverá ser realizada com sucesso'
end

After('@logout') do
  # click_button 'RAFAEL'
  # click_button 'Sair'
  home.deslogar
end

After('@voltar') do
  botoes.clickButtonVoltar
end

After do |scenario|
  # atribunindo 'scenario' uma variavel nome_cenario
  # e utilizando uma regex para retirar caracteres especiais
  scenario_name = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
  # atribuindo nome_cenario a ele mesmo e trocando todos
  # os espacos em branco por '_' e colocando tudo em menusculo
  scenario_name = scenario_name.tr(' ', '_').downcase!

  if scenario.failed?
    printScreenshot(scenario_name, 'falhou')
  elsif scenario.passed?
    printScreenshot(scenario_name, 'passou')
  else
    puts 'Status não encontrado'
  end
end
