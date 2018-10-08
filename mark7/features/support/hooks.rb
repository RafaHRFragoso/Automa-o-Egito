After('@logout') do
    click_link @email
    click_link 'Sair'
end    

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