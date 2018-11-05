class HomePage < SitePrism::Page    
    element :box_usuario, '#box-usuario'
    element :box_sair, '.box-sair'
    element :confirmar_empresa, "procenge-button[tipo='Sim']"
    element :confimar_modulo, "procenge-titulo[modulo='contabilidade']"

    def deslogar
        box_usuario.click
        box_sair.click
    end   
    
    def setDropdown
        box_usuario.click
    end    

    def setEmpresa(empresa)        
        @empresa = empresa   
        
        @empresaAtual = page.find('.box-info > h3').text
        puts @empresaAtual
        @posicao_icon = page.find('#box-info-usuario > div.box-empresas > ul > li:nth-child(31)').text
        puts @posicao_icon 

        
        case @empresa
        when @empresaAtual
            puts 'empresa icon ja selecionada'
        when @posicao_icon
            page.find('#box-info-usuario > div.box-empresas > ul > li:nth-child(31)').click                     
        else 
            page.find('ul.lista-empresas', text: @empresa).click      
        end    
        
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