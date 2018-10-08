class LoginPage < SitePrism::Page

    set_url '/'
    element :usernameField, '#usuario'
    element :passwordnameField, '#senha'
    #element :buttonLogin, 'button[type="submit"]'

    def do_login(user, senha)
        usernameField.set user
        passwordnameField.set senha
        #buttonLogin.click
        click_button 'Entrar'
    end    
    
end