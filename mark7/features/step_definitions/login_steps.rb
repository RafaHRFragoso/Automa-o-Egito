
Dado('que eu acesso a página inicial') do
    #abrindo navegador e passando url
    visit 'http://mark7.herokuapp.com'    
  end
  
  Quando('eu faço login com {string} e {string}') do |email, senha|
    #criando variavel de instancia para pegar o valor de 'email'
    @email = email
    LoginPage.new.faz_login(email,senha)
  end
  
  Então('deve ser autenticado com sucesso') do
    #Validando login efeturado, o comando 'expect' precisa da gem 'rspec'
    expect(page).to have_content @email
  end
  
  Então('devo ver a seguinte mensagem {string}') do |mensagem|
    expect(page).to have_content mensagem
  end