class ManterCentroCusto < SitePrism::Page
  include Pages

  element :codigoCCusto, '#codigo'
  element :descricaoCCusto, '#descricao'
  element :hierarquiaCCusto, '#hierarquia'
  element :divCentroCusto, 'procenge-dropdownrange[identificador="valorcentrocusto"]'
  element :dropdownCCusto, '.ui-textbox-label'
  element :campoFiltroCCusto, '.ui-dropdown-filter.ui-inputtext'
  element :checkCCustoFiltrado, 'td > p-dtcheckbox > div > div.ui-chkbox-box'
  element :hierarquiaInicial, '#hierarquiaInicial'
  element :hierarquiaFinal, '#hierarquiaFinal'
  element :itemFiltroCCusto, '.ui-dropdown-items.ui-dropdown-list'
  element :divDisponiveis, '.ui-picklist-listwrapper', match: :first
  element :campoFiltroAssociar, '.ui-picklist-filter.ui-inputtext'

  @@codCCustoAssociar = '2019A - AUTOMACAO ANALITICO'
  @@codigoCCustoAnalitico = CONFIG['desc_abreviada'] + Faker::Number.number(4)
  @@codigoCCustoSintetico = CONFIG['desc_abreviada'] + Faker::Number.number(4)
  @@hierarquiaCCustoAnalitico = '1.4.8.18'
  @@hierarquiaCCustoSintetico = 991
  @@descCCustoAnalitico = CONFIG['descricao'] + ' ANALITICO'
  @@descCCustoSintetico = CONFIG['descricao'] + ' SINTETICO'
  @@descCCustoAnaliticoAlterada = 'ANALITICO ' + CONFIG['alterado']
  @@descCCustoSinteticoAlterada =  'SINTETICO ' + CONFIG['alterado']

  def incluirCCusto(scenario_name)
    @scenario_name = scenario_name
    @status_scenario = @scenario_name.include?("Analítico")
    case @status_scenario
    when true
      codigoCCusto.click
      codigoCCusto.send_keys(@@codigoCCustoAnalitico)
      descricaoCCusto.set(@@descCCustoAnalitico)
      descricaoCCusto.send_keys :tab
      hierarquiaCCusto.set(@@hierarquiaCCustoAnalitico)
      page.find(:label, 'Analitico').click
    when false  
      codigoCCusto.set(@@codigoCCustoSintetico)
      descricaoCCusto.set(@@descCCustoSintetico)
      descricaoCCusto.send_keys :tab
      hierarquiaCCusto.send_keys(@@hierarquiaCCustoSintetico)
      page.find(:label, 'Sintético').click
    end
  end

  def pesquisarCCusto(status)
    case status
    when 'incluir'
      @@itemCCustoFiltro = @@codigoCCustoAnalitico + ' - ' + @@descCCustoAnalitico
      preencherComboCCusto(@@itemCCustoFiltro)    
    when 'excluir'
      @@itemCCustoFiltro = @@codigoCCustoAnalitico + ' - ' + @@descCCustoAnaliticoAlterada
      preencherComboCCusto(@@itemCCustoFiltro) 
    when 'associar', 'desassociar'
      preencherComboCCusto(@@codCCustoAssociar)
    end  
    page.find(:label, 'Analitico').click
    botoes.clickButtonPesquisar
    checkCCustoFiltrado.click
  end

  def preencherComboCCusto(itemCCustoFiltro)
    within(divCentroCusto) do 
      dropdownCCusto.click
      campoFiltroCCusto.set(itemCCustoFiltro)
      # itemFiltroCCusto.click
    end
    campoFiltroCCusto.send_keys :down
    campoFiltroCCusto.send_keys :enter
  end

  def alterarCCusto
    descricaoCCusto.set(@@descCCustoAnaliticoAlterada)
  end

  def validarDetalharCCusto
    @campoCodigo = codigoCCusto.value
    @campoDescricao = descricaoCCusto.value    
    @campoHierarquia = hierarquiaCCusto.value
    @camposValores = {
      :campoCodigo => @campoCodigo,
      :campoDescricao => @campoDescricao,
      :campoHierarquia => @campoHierarquia.chop.chop,
      :codigoCCusto => @@codigoCCustoAnalitico,
      :descricaiCCusto => @@descCCustoAnalitico,
      :hierarquiaCCusto => @@hierarquiaCCustoAnalitico
    }
  end

  def telaCCustoInicial
    telascontabil.visitTelaGrupoCentroCusto
    telascontabil.visitTelaCentroCusto
  end

  def associarContaCentroCusto
    within(divDisponiveis) do
      campoFiltroAssociar.set('2.1.1.70 - AUTOMACAO ANALITICA') 
    end
    botoes.clickSetaDireitaDupla
  end  

  def desassociarContaCentroCusto
    botoes.clickSetaEsquerdaDupla
  end

  def associarCCustoGrupoCCusto
    within(divDisponiveis) do
      campoFiltroAssociar.set('2019-AUTOMACAO') 
    end
    botoes.clickSetaDireitaDupla
  end

  def desassociarCCustoGrupoCCusto
    botoes.clickSetaEsquerdaDupla
  end
end