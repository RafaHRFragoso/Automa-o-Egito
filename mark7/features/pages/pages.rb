class LoginPage
    include Capybara::DSL

    def faz_login(email,senha)
        #buscando elemento por input name
        find('input[name=email]').set email
        #buscando elemento por id com css selector
        find('#login_password').set senha
        #Clicando em um botão que tem o nome 'Login'
        click_button 'Login'
    end    
end    