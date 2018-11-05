class CadGrupoContaAux < SitePrism::Page

    element :grupoField, '#grupo'
    element :descricaoField, '#descricao'
    #element :filtrarAccordion, '#ui-accordiontab-18'
    element :grupoInicial, "procenge-dropdown[identificador='grupoinicial']" 
    element :grupoFinal, "procenge-dropdown[identificador='grupofinal']" 
    element :confirmar_exclusao, "procenge-button[tipo='Sim']"

    $grupo = Faker::Number.number(4)
    $descricao = Faker::StarWars.character
    $descricaoFiltro = ""

    def preencher_Filtros(grupo, descricao)

        #if descricao == ""
        #    @grupoAtual = $grupo
        #    @descricaoAtual = $descricao
        #    @itemFiltro = @grupoAtual+" - "+@descricaoAtual
            #puts @grupoAtual
            #puts @descricaoAtual
            #puts @itemFiltro
        #else
        #    @grupoAtual = $grupo            
        #    @descricaoAtual = descricao
        #    @itemFiltro = @grupoAtual+" - "+@descricaoAtual
            #puts @grupoAtual
            #puts @descricaoAtual
            #puts @itemFiltro
        #end
         
        case
            when descricao == "" 
                @grupoAtual = $grupo
                @descricaoAtual = $descricao
                @itemFiltro = @grupoAtual+" - "+@descricaoAtual
            else
                @grupoAtual = $grupo            
                @descricaoAtual = descricao
                @itemFiltro = @grupoAtual+" - "+@descricaoAtual    
        end    
   
        #@itemFiltro
        #click_link 'Filtrar'
        grupoInicial.click    
        #page.find('p-dropdown > div.ui-dropdown-open > div.ui-dropdown-panel > div.ui-dropdown-filter-container > .ui-dropdown-filter.ui-inputtext').send_keys(@itemFiltro)
        page.find('.ui-dropdown-filter.ui-inputtext').send_keys(@itemFiltro)                    
        page.find('ul.ui-dropdown-items', text: @itemFiltro).click            
        grupoFinal.click
        #page.find('p-dropdown > div.ui-dropdown-open > div.ui-dropdown-panel > div.ui-dropdown-filter-container > .ui-dropdown-filter.ui-inputtext').send_keys(@itemFiltro)
        page.find('.ui-dropdown-filter.ui-inputtext').send_keys(@itemFiltro)               
        page.find('ul.ui-dropdown-items', text: @itemFiltro).click
    end

    def confirm_Exclusao        
        @message_alert = page.has_text?('Tem certeza que deseja excluir?')
        case @message_alert
        when true
            confirmar_exclusao.click
        end    
    end  

end  