class ManterContaAux < SitePrism::Page
  include Pages
  element :dropdownGCA, 'procenge-dropdown > div > p-dropdown > div > label'
  element :campoFiltrarGCA, 'input[class="ui-dropdown-filter ui-inputtext ui-widget ui-state-default ui-corner-all"]'
  element :itemFiltrado, '.ui-dropdown-item'
  element :campoCodigo, '#codigo'
  element :campoDescricao, '#descricao'
  element :campoContaInicial, '#containicial'
  element :campoContaFinal, '#contaFinal'
  element :checkItemFiltrado, 'td > p-dtcheckbox > div > div.ui-chkbox-box'
 
  @@codigoConta = Faker::Number.number(4)
  @@descricaoInicial = CONFIG['descricao'] + @@codigoConta
  @@descricaoFinal = CONFIG['descricao'] + Faker::Number.number(4)
  @@GCA = '2019 - AUTOMACAO'

  def incluirCA
    dropdownGCA.click
    campoFiltrarGCA.set(@@GCA)
    itemFiltrado.click
    campoCodigo.set(@@codigoConta)
    campoDescricao.set(@@descricaoInicial)
  end

  def pesquisarCA(status)
    @status = status
    dropdownGCA.click
    campoFiltrarGCA.set(@@GCA)
    itemFiltrado.click
    campoContaInicial.set(@@codigoConta)
    campoContaFinal.set(@@codigoConta)
    case @status
    when 'incluir'
      campoDescricao.set(@@descricaoInicial)
    when 'excluir'
      campoDescricao.set(@@descricaoFinal)
    end
    botoes.clickButtonPesquisar
    checkItemFiltrado.click
  end

  def alterarCA
    campoDescricao.set(@@descricaoFinal)
  end

  def validarDetalharCA
    @campoCodigo = campoCodigo.value
    @campoDescricao = campoDescricao.value
    @camposValores = {
      :campoCodigo => @campoCodigo,
      :campoDescricao => @campoDescricao,
      :codigoPesquisa => @@codigoConta,
      :descicaoInicial => @@descricaoInicial
    }
  end
end