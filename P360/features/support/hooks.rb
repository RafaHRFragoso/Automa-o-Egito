Before('@background_GCA') do
    step 'que o usuário acesse a página inicial'
    step 'o usuário realizar o login'
    step 'deve ser autenticado com sucesso'
    step 'selecionar a empresa "ICOM COMÉRCIO - SP"'
    step 'acessar a tela de Grupos de Contas Auxiliares'        
    step 'o sistema deve exibir a tela de Grupos de Contas Auxiliares'
end

Before('@tela_GCA') do
    visit '/contabilidade/grupocontaauxiliar'
end

After('@logout') do
    #click_button 'RAFAEL'
    #click_button 'Sair'
    home.deslogar
end   

After do |scenario|
    #atribunindo 'scenario' uma variável nome_cenario e utilizando uma regex para retirar caracteres especiais
    scenario_name = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
    #atribuindo nome_cenario a ele mesmo e trocando todos os espaços em branco por '_' e colocando tudo em menusculo
    scenario_name = scenario_name.gsub(' ', '_').downcase!

    case
    when scenario.failed?
        tirar_foto(scenario_name, 'falhou')
    when scenario.passed?
        tirar_foto(scenario_name, 'passou')
    end
end

=begin
After do |scenario|
    #atribunindo 'scenario' uma variável nome_cenario e utilizando uma regex para retirar caracteres especiais
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
    #atribuindo nome_cenario a ele mesmo e trocando todos os espaços em branco por '_' e colocando tudo em menusculo
    nome_cenario = nome_cenario.gsub(' ', '_').downcase!
    #criando diretório de screenshot e atribuindo a variável nome_cenario dinamicamente ao screenshot que será feito
    screenshot = "log/screenshots/#{nome_cenario}.png"
    #utilizando capybara para tirar o screenshot passando a variável 'screenshot' como parametro com o caminho e nome do screnshot
    page.save_screenshot(screenshot) 
    #anexando screenshots aos report
    embed(screenshot, 'image/png', 'Evidencia')
end
=end