class HomePage < SitePrism::Page    
    element :dropdown_empresa, '#dropdownMenu1 .fa-angle-down'
    #element :confirmar_empresa, "button[type='button']"
    element :confirmar_empresa, "procenge-button[tipo='Sim']"
    element :confimar_modulo, "procenge-titulo[modulo='contabilidade']"

    def deslogar
        #userHome.click
        click_button 'RAFAEL'
        click_button 'Sair'
    end   
    
    def setDropdown
        dropdown_empresa.click
        #dropdown_empresa2.click
    end    

    def setEmpresa(empresa)
        @empresa = empresa
        click_button @empresa        
    end   
    
    def confirm_empresa        
        @message_alert = page.has_text?('As informações da tela serão perdidas, deseja continuar?')
        case @message_alert
        when true
            confirmar_empresa.click
        end    
    end  
end

class ModulosPage <SitePrism::Page

    element :modulo_contabil, "a[href*='/P360/contabilidade/home']"

    def setModuloContabil
        modulo_contabil.click
    end

end    