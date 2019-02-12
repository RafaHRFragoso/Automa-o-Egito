class ManterContaCCustoContaAux < SitePrism::Page
  include Pages

  element :divContaContabil, 'procenge-dropdown[identificador="contacontabil"]'
  element :divCentroCusto, 'procenge-dropdown[identificador="centrocusto"]'
  element :divContaAuxiliar, 'procenge-dropdown[identificador="contaauxiliar"]'
  element :divCentroCustoPesquisa, 'procenge-dropdownrange[identificador="centrocusto"]'
  element :divContaAuxiliarPesquisa, 'procenge-dropdownrange[identificador="contaauxiliar"]'
  element :dropdownCCCCA, '.ui-dropdown'
  element :campoFiltroCCCCA, '.ui-dropdown-filter.ui-inputtext'
  element :itemFiltroCCCCA, '.ui-dropdown-items.ui-dropdown-list'
  element :checkCCCAFiltrado, 'td > p-dtcheckbox > div > div.ui-chkbox-box'

  @@contaContabilInicial = '2.1.1.71 - CONTA AUTO COMPLETA'
  @@centroCustoInicial = '2019A - AUTOMACAO ANALITICO'
  @@contaAuxInicial = 'AUT01 - CA AUTO 01' 
  @@contaAuxFinal = 'AUT02 - CA AUTO 02'

  def incluirCCCCA
    within(divContaContabil) do
      dropdownCCCCA.click
      campoFiltroCCCCA.set(@@contaContabilInicial)
      itemFiltroCCCCA.click
    end
    within(divCentroCusto) do
      dropdownCCCCA.click
      campoFiltroCCCCA.set(@@centroCustoInicial)
      itemFiltroCCCCA.click
    end
    within(divContaAuxiliar) do
      dropdownCCCCA.click
      campoFiltroCCCCA.set(@@contaAuxInicial)
      itemFiltroCCCCA.click
      # page.all(:css, 'li')[0].click
    end
  end

  def pesquisarCCCCA    
    within(divContaContabil) do
      dropdownCCCCA.click
      campoFiltroCCCCA.set(@@contaContabilInicial)
      itemFiltroCCCCA.click
    end
    within(divCentroCustoPesquisa) do
      dropdownCCCCA.click
      campoFiltroCCCCA.set(@@centroCustoInicial)
      itemFiltroCCCCA.click
    end
    within(divContaAuxiliarPesquisa) do
      dropdownCCCCA.click
      campoFiltroCCCCA.set(@@contaAuxInicial)
      itemFiltroCCCCA.click
    end
    botoes.clickButtonPesquisar
    checkCCCAFiltrado.click
  end

  def validarDetalharCCCCA
    within(divContaContabil) do
      # @campoContaContabil = dropdownCCCCA.text[0...30]
      @campoContaContabil = dropdownCCCCA.text
      53.times do @campoContaContabil.chop! end
      # puts @campoContaContabil
    end
    within(divCentroCusto) do
      @campoCentroCusto = dropdownCCCCA.text
      # puts @campoCentroCusto
    end
    within(divContaAuxiliar) do
      @campoContaAuxiliar = dropdownCCCCA.text
      # puts @campoContaAuxiliar
    end
    @camposValoresCCCCA = {
      :campoContaContabil => @campoContaContabil,
      :campoCentroCusto => @campoCentroCusto,
      :campoContaAuxiliar => @campoContaAuxiliar,
      :contaInicial => @@contaContabilInicial,
      :centroCustoInicial => @@centroCustoInicial,
      :contaAuxInicial => @@contaAuxInicial
    }
  end

  def alterarCCCCA
    @@contaAuxInicial = @@contaAuxFinal
    within(divContaAuxiliar) do
      dropdownCCCCA.click
      campoFiltroCCCCA.set(@@contaAuxInicial)
      itemFiltroCCCCA.click
    end
  end
end