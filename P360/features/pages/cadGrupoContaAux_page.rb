# PAGE TELA GRUPO DE CONTA AUXILIAR
class CadGrupoContaAux < SitePrism::Page
  element :grupoField, '#grupo'
  element :descricaoField, '#descricao'
  # element :filtrarAccordion, '#ui-accordiontab-18'
  element :divgrupoInicial, "procenge-dropdown[identificador='grupoinicial']"
  element :dropgrupoInicial, '.form-control.ng-tns-c11-7'
  element :divgrupoFinal, "procenge-dropdown[identificador='grupofinal']"
  element :dropgrupoFinal, '.form-control.ng-tns-c11-8'
  element :confirmar_exclusao, "procenge-button[tipo='Sim']"

  $grupo = Faker::Number.number(4)
  $descricao = Faker::StarWars.character
  $descricaoFiltro = ''

  def preencher_Filtros(descricao)
    case
    when descricao == ''
      @grupoAtual = $grupo
      @descricaoAtual = $descricao
      @itemFiltro = @grupoAtual + ' - ' + @descricaoAtual
    else
      @grupoAtual = $grupo
      @descricaoAtual = descricao
      @itemFiltro = @grupoAtual + ' - ' + @descricaoAtual
    end

    within(divgrupoInicial) do
      # grupoInicial.click
      dropgrupoInicial.click
      # page.find('.form-control.ng-tns-c11-7').click
      # page.find('p-dropdown > div.ui-dropdown-open > div.ui-dropdown-panel > div.ui-dropdown-filter-container > .ui-dropdown-filter.ui-inputtext').send_keys(@itemFiltro)
      page.find('.ui-dropdown-filter.ui-inputtext').send_keys(@itemFiltro)
      page.find('ul.ui-dropdown-items', text: @itemFiltro).click
    end

    within(divgrupoFinal) do
      # grupoFinal.click
      dropgrupoFinal.click
      # page.find('.form-control.ng-tns-c11-8').click
      # page.find('p-dropdown > div.ui-dropdown-open > div.ui-dropdown-panel > div.ui-dropdown-filter-container > .ui-dropdown-filter.ui-inputtext').send_keys(@itemFiltro)
      page.find('.ui-dropdown-filter.ui-inputtext').send_keys(@itemFiltro)
      page.find('ul.ui-dropdown-items', text: @itemFiltro).click
    end
  end

  def confirm_Exclusao
    @message_alert = page.has_text?('Tem certeza que deseja excluir?')
    case @message_alert
    when true
      confirmar_exclusao.click
    end
  end
end
