# PAGE TELA GRUPO DE CONTA AUXILIAR
class ManterGrupoContaAux < SitePrism::Page
  element :grupoField, '#grupo'
  element :descricaoField, '#descricao'
  element :divgrupoInicial, "procenge-dropdown[identificador='grupoinicial']"
  # element :dropgrupoInicial, '.form-control.ng-tns-c11-7'
  element :dropgrupoInicial, '.ui-dropdown-label'
  element :divgrupoFinal, "procenge-dropdown[identificador='grupofinal']"
  # element :dropgrupoFinal, '.form-control.ng-tns-c11-8'
  element :dropgrupoFinal, '.ui-dropdown-label'
  element :confirmar_exclusao, "procenge-button[tipo='Sim']"

  $grupo = Faker::Number.number(4)
  $descricao = Faker::StarWars.character
  $descricaoFiltro = ''

  def preencherFiltros(descricao)
    # case
    # when descricao == ''
    #   @grupoAtual = $grupo
    #   @descricaoAtual = $descricao
    #   @itemFiltro = @grupoAtual + ' - ' + @descricaoAtual
    # else
    #   @grupoAtual = $grupo
    #   @descricaoAtual = descricao
    #   @itemFiltro = @grupoAtual + ' - ' + @descricaoAtual
    # end
    @grupo_atual = $grupo
    @descricao_atual = case descricao
                       when ''
                         $descricao
                       else
                         descricao
                       end
    @item_filtro = @grupo_atual + ' - ' + @descricao_atual
    puts @item_filtro
    within(divgrupoInicial) do
      dropgrupoInicial.click
      page.find('.ui-dropdown-filter.ui-inputtext').send_keys(@item_filtro)
      page.find('ul.ui-dropdown-items', text: @item_filtro).click
    end

    within(divgrupoFinal) do
      dropgrupoFinal.click
      page.find('.ui-dropdown-filter.ui-inputtext').send_keys(@item_filtro)
      page.find('ul.ui-dropdown-items', text: @item_filtro).click
    end
  end

  def confirmExclusao
    @message_alert = page.has_text?('Tem certeza que deseja excluir?')
    case @message_alert
    when true
      confirmar_exclusao.click
    end
  end
end
