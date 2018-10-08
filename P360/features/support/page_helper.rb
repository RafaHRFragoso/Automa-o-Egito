Dir[File.join(File.dirname(__FILE__),
    '../pages/*_page.rb')].each { |file| require file}

module Pages
    def login
        @login ||= LoginPage.new
    end   
    def home
        @home ||= HomePage.new
    end        
    def modulo
        @modulo ||= ModulosPage.new
    end  
    def botoes
        @botoes ||= BotoesPage.new
    end    
    def telascontabil
        @telascontabil ||= TelasContabilidadePage.new
    end   

end    