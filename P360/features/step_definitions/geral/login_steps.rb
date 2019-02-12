Dado('que o usuário acesse a página inicial') do
  login.load
end

Quando('logar com {string} e {string}') do |user, senha|
  login.tryLogin(user, senha)
end

Quando('o usuário realizar o login') do
  login.doLogin
end

Então('a logo do sistema deve ser exibida') do
  page.assert_selector('.logo')
end

Então('deve ser autenticado com sucesso') do
  expect(page).to have_content('Rafael')
end

Então('devo ver a seguinte mensagem {string}') do |mensagem|
  page.assert_text(mensagem)
end
