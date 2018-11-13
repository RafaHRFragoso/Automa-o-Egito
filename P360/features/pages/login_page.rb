class LoginPage < SitePrism::Page

    set_url '/'
    element :usernameField, '#usuario'
    element :passwordnameField, '#senha'
    #element :buttonLogin, 'button[type="submit"]'

    def read_U
        File.open('info.aut', 'r') do |arq|
            arq.each_line do |li|
                case li
                when (/USER/i)
                    #puts "Found user: #{li}"            
                    @user = li
                    @user = @user.gsub(/^USER:/, "").strip
                end
            end
        end  
        return @user.to_s          
    end

    def read_S
        File.open('info.aut', 'r') do |arq|
            arq.each_line do |li|
                case li
                when (/PASSWD/i)
                    #puts "Found PASSWD: #{li}"                
                    @pssw = li
                    @pssw = @pssw.gsub(/^PASSWD:/, "").strip
                end
            end
        end   
        return @pssw.to_s            
    end

    def do_login(user,senha)
        #user = 'RAFAEL2'
        #senha = 'PIRAMIDE'
        usernameField.set(user)
        passwordnameField.set(senha)
        #buttonLogin.click
        click_button 'Entrar'
    end    
    
end