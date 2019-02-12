class ManterContaContabil < SitePrism::Page
  include Pages

  element :campoContaCont, '#CONTA'
  element :divDescricaoConta, 'procenge-inputtextarea[identificador="DESCRICAO"]'
  element :campoDescricaoConta, '.ui-inputtext'
  element :dropdownContaCont, '#containicialfinal'
  element :campoFiltroConta, '.ui-dropdown-filter.ui-inputtext'
  element :checkItemFiltrado, 'td > p-dtcheckbox > div > div.ui-chkbox-box'
  element :divDisponiveis, '.ui-picklist-listwrapper', match: :first
  element :campoFiltroAssociar, '.ui-picklist-filter.ui-inputtext'
  element :divListEmpresas, 'procenge-listboxmultivalorado[nome="Empresas"]'
  element :campoFiltroEmpresas, 'input[role="textbox"]'
  element :itemFiltroEmpresas, 'ul.ui-listbox-list'

  @@codContaAssociar = '2.1.1.70'
  @@codContaContSint = '1.1.1.88'
  @@codContaContAnali = '1.1.1.01.224'
  @@descContaContSint  = CONFIG['descricao'] + ' SINTETICA'
  @@descContaContAnali  = CONFIG['descricao'] + ' ANALITICA'
  @@descContaContSintAlterada = 'SINTETICA ' + CONFIG['alterado']
  @@descContaContAnaliAlterada = 'ANALITICA ' + CONFIG['alterado']
  
  def incluirCC(scenario_name)
    @scenario_name = scenario_name
    @status_scenario = @scenario_name.include?("Analítica")
    case @status_scenario
    when true
      campoContaCont.set(@@codContaContAnali)
      within(divDescricaoConta) do
        campoDescricaoConta.set(@@descContaContAnali)
      end
      page.find(:label, 'Analítica').click
      page.find(:label, 'Centro de Custo').click
    when false
      campoContaCont.set(@@codContaContSint)
      within(divDescricaoConta) do
        campoDescricaoConta.set(@@descContaContSint)
      end
      page.find(:label, 'Sintética').click      
    end
  end

  def pesquisarCC(status)
    @status = status
    dropdownContaCont.click
    case @status
    when 'incluir'
      @@itemContaFiltro = @@codContaContAnali + ' - ' + @@descContaContAnali
      preencherComboConta(@@itemContaFiltro)   
      page.find(:label, 'Analítica').click   
    when 'excluir'
      @@itemContaFiltro = @@codContaContAnali + ' - ' + @@descContaContAnaliAlterada
      preencherComboConta(@@itemContaFiltro) 
      page.find(:label, 'Analítica').click
    when 'associar', 'copiar'
      preencherComboConta(@@codContaAssociar)
    end  
    botoes.clickButtonPesquisar
    checkItemFiltrado.click
  end

  def preencherComboConta(itemContaFiltro)
    within(dropdownContaCont) do      
      campoFiltroConta.set(itemContaFiltro)
      campoFiltroConta.send_keys :down
      campoFiltroConta.send_keys :enter
    end
  end

  def alterarCC
    within(divDescricaoConta) do
      campoDescricaoConta.set(@@descContaContAnaliAlterada)
    end
  end

  def validarDetalharCC
    @campoContaCont = campoContaCont.value
    within(divDescricaoConta) do
      @campoDescContaCont = campoDescricaoConta.value
    end
    @camposValoresConta = {
      :campoConta => @campoContaCont,
      :campoDescricao => @campoDescContaCont,
      :contaInclusao => @@codContaContAnali,
      :descicaoInclusao => @@descContaContAnali
    }
  end

  def associarCentroCustoConta
    within(divDisponiveis) do
      campoFiltroAssociar.set('2019A - AUTOMACAO ANALITICO') 
    end
    botoes.clickSetaDireitaDupla
  end  

  def desassociarCentroCustoConta
    botoes.clickSetaEsquerdaDupla
  end

  def copiarCC
    within(divListEmpresas) do
      campoFiltroEmpresas.set('AGR - AGROS')      
      itemFiltroEmpresas.click
    end
  end
end
