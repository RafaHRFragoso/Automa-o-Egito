# PAGE TELA GRUPO DE CONTA AUXILIAR
class ManterGrupoContaAux < SitePrism::Page
  element :grupoField, '#grupo'
  element :descricaoField, '#descricao'
  element :divgrupoInicial, "procenge-dropdown[identificador='grupoinicial']"
  element :dropdown, '.ui-dropdown-label'
  #element :dropgrupoInicial, '.ui-dropdown-label'
  element :divgrupoFinal, "procenge-dropdown[identificador='grupofinal']"
  # element :dropgrupoFinal, '.ui-dropdown-label'
  element :confirmar_exclusao, "procenge-button[tipo='Sim']"
  element :boxFiltro, '.ui-dropdown-filter.ui-inputtext'
  element :clickFiltro, 'ul.ui-dropdown-items'
  element :flagFiltro, 'td > p-dtcheckbox > div > div.ui-chkbox-box'

  @@grupo = Faker::Number.number(4)
  @@descricao = Faker::StarWars.character
  @@descricaoFinal = Faker::StarWars.character

  def preencherFiltros(status)
    @status = status
    case @status
    when 'incluido'
      @item_filtro = @@grupo + ' - ' + @@descricao
      preencherCombos(@item_filtro)
    when 'alterado'
      @item_filtro = @@grupo + ' - ' + @@descricaoFinal
      preencherCombos(@item_filtro)
    end
  end

  def preencherCombos(item_filtro)
    @item_filtro = item_filtro
    within(divgrupoInicial) do
      dropdown.click
      #page.find('.ui-dropdown-filter.ui-inputtext').send_keys(@item_filtro)
      #page.find('ul.ui-dropdown-items', text: @item_filtro).click
      boxFiltro.set(@item_filtro)
      clickFiltro.click
    end
    within(divgrupoFinal) do
      dropdown.click
      boxFiltro.set(@item_filtro)
      clickFiltro.click
    end
  end

    # @grupo_atual = $grupo
    # @descricao_atual = case descricao
    #                    when ''
    #                      $descricao
    #                    else
    #                      descricao
    #                    end
    # @item_filtro = @grupo_atual + ' - ' + @descricao_atual
    # puts @item_filtro
    
    # within(divgrupoInicial) do
    #   dropgrupoInicial.click
    #   page.find('.ui-dropdown-filter.ui-inputtext').send_keys(@item_filtro)
    #   page.find('ul.ui-dropdown-items', text: @item_filtro).click
    # end

    # within(divgrupoFinal) do
    #   dropgrupoFinal.click
    #   page.find('.ui-dropdown-filter.ui-inputtext').send_keys(@item_filtro)
    #   page.find('ul.ui-dropdown-items', text: @item_filtro).click
    # end

  def confirmExclusao
    @message_alert = page.has_text?('Tem certeza que deseja excluir?')
    case @message_alert
    when true
      confirmar_exclusao.click
    end
  end

  def alterarDescricao
    descricaoField.set(@@descricaoFinal)
  end

  def incluirGCA
    descricaoField.set(@@descricao)
    grupoField.set(@@grupo)
  end
end
