class ManterHistoricoPadrao < SitePrism::Page
  # elementos para o metodo preencherCampos
  include Pages
  element :campoCodigo, 'input[id="codigo"]'
  element :campoHistorico, 'input[id="historico"]'
  element :checkIncluirComplemento, 'div[class="ui-chkbox-box ui-widget ui-corner-all ui-state-default"]'
  element :campoFiltrarOrigem, 'input[id="campotabelacomplemento00"]'
  element :itemFiltradoOrigem, 'div:nth-child(1) > p-autocomplete > span > div > ul > li > span'
  element :adicionarComplemento, 'div > div.tr.ng-star-inserted > div:nth-child(2) > a'
  element :itemComplemento, 'div.ui-listbox-list-wrapper > ul > li:nth-child(13) > span'
  element :divDescricao, 'procenge-inputtextarea[identificador="descricao"]'
  element :campoDescricao, '.ui-inputtext'
   # elementos para o metodo pesquisarHP
  element :campoCodigoInicial, 'Input[id="codigohistoricovalorInicial"]'
  element :campoCodigoFinal, 'Input[id="codigohistoricovalorFinal"]'
  element :campoDescInicial, 'Input[id="descricaovalorInicial"]'
  element :campoDescFinal, 'Input[id="descricaovalorFinal"]'
  element :checkItemFiltrado, 'td > p-dtcheckbox > div > div.ui-chkbox-box'

  @@valorCodigo = 'T' + Faker::Number.number(3) 
  @@valorHistorico = CONFIG['descricao'] + @@valorCodigo
  @@valorHistoricoAlterado = CONFIG['descricao']  + Faker::Number.number(3) 

  def incluirHP
    campoCodigo.set(@@valorCodigo)
    campoHistorico.set(@@valorHistorico)
    checkIncluirComplemento.click
    botoes.clickButtonAdicionarOrigem
    campoFiltrarOrigem.set('CAIXA')
    itemFiltradoOrigem.click
    adicionarComplemento.click
    itemComplemento.click
    within(divDescricao) do
      campoDescricao.set('Automacao')
    end
    botoes.clickButtonAdicionar
  end

  def pesquisarHP(status)
    campoCodigoInicial.set(@@valorCodigo)
    campoCodigoFinal.set(@@valorCodigo)
    case status
    when 'incluir'
      campoDescInicial.set(@@valorHistorico)
    #  campoDescFinal.set(@@valorHistorico)
    when 'excluir'
      campoDescInicial.set(@@valorHistoricoAlterado)
    #  campoDescFinal.set(@@valorHistoricoAlterado)
    end
    botoes.clickButtonPesquisar
    checkItemFiltrado.click
    # campoDescFinal está comentado pois o 360 se encontra 
    # com bug na quantidade de caracteres na pesquisa

  end

  def validarDetalharHP
    @campoCodigo = campoCodigo.value
    @campoHistorico = campoHistorico.value
    @campoValores = {
      :campoCodigo => @campoCodigo,
      :campoHistorico => @campoHistorico,
      :valorCodigo => @@valorCodigo,
      :valorHistorico => @@valorHistorico
    }
  end

  def alterarHP
    campoHistorico.set(@@valorHistoricoAlterado)
  end
 end