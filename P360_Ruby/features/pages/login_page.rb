class LoginPage
    include Capybara::DSL

    def faz_login(user, senha)
        find('#usuario').set user
        find('#senha').set senha
        click_button 'Entrar'
    end        
end