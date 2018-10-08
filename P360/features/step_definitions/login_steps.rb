Dado("que o usuário acesse a página inicial") do
  #@login = LoginPage.new
  login.load
end
  
  Quando("logar com {string} e {string}") do |user, senha|    
    login.do_login(user, senha)

end

  Então("a logo do sistema deve ser exibida") do
    page.assert_selector('.logo')

end
 
  Então("deve ser autenticado com sucesso") do
    #expect(page).to have_content 'RAFAEL'
    page.assert_text('RAFAEL')
end

  Então('devo ver a seguinte mensagem {string}') do |mensagem|
    #expect(page).to have_content mensagem
    page.assert_text(mensagem)
end

  Então("vai ter um seletor css com o texto {string}") do |mensagem|
    expect(page).to have_css('#dropdownMenu1', text: mensagem)
end
