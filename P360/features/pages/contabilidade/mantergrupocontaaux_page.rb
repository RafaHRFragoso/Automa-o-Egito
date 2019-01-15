# PAGE TELA GRUPO DE CONTA AUXILIAR
class ManterGrupoContaAux < SitePrism::Page
  include Pages
  # include RSpec::Matchers
  element :grupoField, '#grupo'
  element :descricaoField, '#descricao'
  element :dropdownGrupo, '.ui-dropdown-label'
  element :divgrupoInicial, "procenge-dropdown[identificador='grupoinicial']"
  element :divgrupoFinal, "procenge-dropdown[identificador='grupofinal']"
  element :campoFiltro, '.ui-dropdown-filter.ui-inputtext'
  element :clickCampoFiltro, 'ul.ui-dropdown-items'
  element :checkFiltro, 'td > p-dtcheckbox > div > div.ui-chkbox-box'

  @@grupo = Faker::Number.number(4)
  @@descricao = Faker::StarWars.character
  @@descricaoFinal = Faker::StarWars.character

  def pesquisarGCA(status_scenario)
    @status_scenario = status_scenario
    case @status_scenario
    when 'incluir'
      @item_filtro = @@grupo + ' - ' + @@descricao
      preencherCombos(@item_filtro)
    when 'excluir'
      @item_filtro = @@grupo + ' - ' + @@descricaoFinal
      preencherCombos(@item_filtro)
    end
    botoes.clickButtonPesquisar
    checkFiltro.click
  end

  def preencherCombos(item_filtro)
    @item_filtro = item_filtro
    within(divgrupoInicial) do
      dropdownGrupo.click
      campoFiltro.set(@item_filtro)
      clickCampoFiltro.click
    end
    within(divgrupoFinal) do
      dropdownGrupo.click
      campoFiltro.set(@item_filtro)
      clickCampoFiltro.click
    end
  end

  def confirmExclusao
    @message_alert = page.has_text?('Tem certeza que deseja excluir?')
    case @message_alert
    when true
      botoes.clickButtonSim
    end
  end

  def alterarGCA
    descricaoField.set(@@descricaoFinal)
  end

  def incluirGCA
    descricaoField.set(@@descricao)
    grupoField.set(@@grupo)
  end

  def validarDetalharGCA
    @grupoGCA = page.find(grupoField).value
    @descricaoGCA = page.find(descricaoField).value
    puts 'pegou da tela'
    puts @grupoGCA
    puts @descricaoGCA
    puts 'faker gerou'
    puts @@grupo
    puts @@descricao
    
    expect(@grupoGCA).to eql(@@grupo)
    expect(@descricaoGCA).to eql(@@descricao)
  end

end
