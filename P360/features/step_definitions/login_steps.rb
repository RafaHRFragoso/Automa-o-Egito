Dado("que o usuário acesse a página inicial") do
  #@login = LoginPage.new
  login.load
  #visit '/'
end
  
  Quando("logar com {string} e {string}") do |user, senha|    
    login.do_login(user, senha)

end

Quando("o usuário realizar o login") do
  user = login.read_U
  senha = login.read_S
  login.do_login(user,senha)
end

  Então("a logo do sistema deve ser exibida") do
    page.assert_selector('.logo')

end
 
  Então("deve ser autenticado com sucesso") do
    #expect(page).to have_content 'RAFAEL'
    expect(page).to have_content("Rafael")    
    #page.assert_text('RAFAEL')
=begin
    text = page.find('.moduloanuncio.moduloanuncio2')
    @text_page = text.text
    puts @text_page
    puts @text_page[2,3] #râm
    puts @text_page[2,6] #râmide
    puts @text_page[2..3] #râ
    puts @text_page[-5,3] #Sto
    puts @text_page[-5..-2] #Stor
=end    
end

  Então('devo ver a seguinte mensagem {string}') do |mensagem|
    #expect(page).to have_content mensagem
    page.assert_text(mensagem)
end