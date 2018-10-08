Dado("que eu acesso a página inicial") do
    #abrindo navegador e passando url    
    #visit 'http://10.50.254.162/P360/'
    visit ('/')       
  end
  
Quando("eu faço login com {string} e {string}") do |user, senha|
    #@user = user
    #login = LoginPage.new
    login.faz_login(user, senha)
end

Então("deve ser autenticado com sucesso") do
    #Validando login efeturado, o comando 'expect' precisa da gem 'rspec'
    expect(page).to have_content 'RAFAEL'
end

Então('devo ver a seguinte mensagem {string}') do |mensagem|
    expect(page).to have_content mensagem
  end

Então("vai ter um seletor css com o texto {string}") do |mensagem|
    #Validando login efeturado, o comando 'expect' precisa da gem 'rspec'
    expect(page).to have_css('#dropdownMenu1', text: mensagem)
end