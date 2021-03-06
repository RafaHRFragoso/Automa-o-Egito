# PAGE DE LOGIN
class LoginPage < SitePrism::Page
  set_url '/'
  element :usernameField, '#usuario'
  element :passwordnameField, '#senha'
  # element :buttonLogin, 'button[type="submit"]'

  def readUser
    File.open('info.aut', 'r') do |arq|
      arq.each_line do |li|
        case li
        when /USER/i
          # puts "Found user: #{li}"
          @user = li
          @user = @user.gsub(/^USER:/, '').strip
        end
      end
    end
    # return @user.to_s
  end

  def readPasswd
    File.open('info.aut', 'r') do |arq|
      arq.each_line do |li|
        case li
        when /PASSWD/i
          # puts "Found PASSWD: #{li}"
          @pssw = li
          @pssw = @pssw.gsub(/^PASSWD:/, '').strip
        end
      end
    end
    # return @pssw.to_s
  end

  def tryLogin(user, password)
    @user = user
    @password = password
    usernameField.set(@user)
    passwordnameField.set(@password)
    click_button 'Entrar'
  end

  def doLogin
    @user = CONFIG['user']
    @password = CONFIG['password']
    usernameField.set(@user)
    passwordnameField.set(@password)
    click_button 'Entrar'
  end
end
