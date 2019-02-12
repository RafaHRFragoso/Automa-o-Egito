# PAGE TELA GRUPO DE CONTA AUXILIAR
class ManterGrupoContaAux < SitePrism::Page
  include Pages
  element :campoGrupo, '#grupo'
  element :campoDescricao, '#descricao'
  element :dropdownGrupo, '.ui-dropdown-label'
  element :divGrupoInicial, "procenge-dropdown[identificador='grupoinicial']"
  element :divGrupoFinal, "procenge-dropdown[identificador='grupofinal']"
  element :campoFiltro, '.ui-dropdown-filter.ui-inputtext'
  element :clickCampoFiltro, 'ul.ui-dropdown-items'
  element :checkItemFiltrado, 'td > p-dtcheckbox > div > div.ui-chkbox-box'

  @@grupo = Faker::Number.number(4)
  @@descricao = CONFIG['descricao'] + @@grupo
  @@descricaoFinal = CONFIG['descricao'] + Faker::Number.number(4)
 
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
    checkItemFiltrado.click
  end

  def preencherCombos(item_filtro)
    @item_filtro = item_filtro
    within(divGrupoInicial) do
      dropdownGrupo.click
      campoFiltro.set(@item_filtro)
      sleep 1
      campoFiltro.send_keys :down
      campoFiltro.send_keys :enter
    end
    within(divGrupoFinal) do
      dropdownGrupo.click
      campoFiltro.set(@item_filtro)
      campoFiltro.send_keys :down
      campoFiltro.send_keys :enter

    end
  end

  # def preencherCombos(item_filtro)
  #   @item_filtro = item_filtro
  #   within(divGrupoInicial) do
  #     dropdownGrupo.click
  #     campoFiltro.set(@item_filtro)
  #     clickCampoFiltro.click
  #   end
  #   within(divGrupoFinal) do
  #     dropdownGrupo.click
  #     campoFiltro.set(@item_filtro)
  #     clickCampoFiltro.click
  #   end
  # end

  def confirmExclusao
    @message_alert = page.has_text?('Tem certeza que deseja excluir?')
    case @message_alert
    when true
      botoes.clickButtonSim
    end
  end

  def alterarGCA
    campoDescricao.set(@@descricaoFinal)
  end

  def incluirGCA
    campoDescricao.set(@@descricao)
    campoGrupo.set(@@grupo)
  end

  def validarDetalharGCA
    @grupoGCA = campoGrupo.value
    @descricaoGCA = campoDescricao.value
    @camposValores = {
      :grupoGCA => @grupoGCA, 
      :descricaoGCA => @descricaoGCA, 
      :grupo => @@grupo, 
      :descricao => @@descricao
    }
  end
  # ESTE É UM METODO TEMPORÁRIO E DEVERÁ SER EXCLUÍDO QUANDO RESLVER O PROBLEMA DE CARREGAR O 
  # ITEM INCLUIDO NO COMBO DE FILTRO APÓS CLICAR NO BOTÃO VOLTAR OU O SISTEMA PERMITIR 
  # NOVAMENTE RECARREGAR A PÁGINA OU ACESSAR A PAGINA DIRETAMENTE PELA URL
  def telaGCAInicial
    botoes.clickButtonVoltar
    telascontabil.visitTelaGruposContabeis
    telascontabil.visitTelaGruposdeContasAuxiliares
  end
end
