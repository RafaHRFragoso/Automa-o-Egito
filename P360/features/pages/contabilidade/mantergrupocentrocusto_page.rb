class ManterGrupoCentroCusto < SitePrism::Page
  include Pages

  element :campoCodigo, '#codigo'
  element :campoDescricao, '#descricao'
  element :picklistDisponiveis, 'p-picklist[sourceheader="Disponíveis"]'
  element :campoPicklist, '.ui-inputtext', match: :first
  element :campoCodigoInicial, '#codigocentrocustovalorInicial'
  element :campoCodigoFinal, '#codigocentrocustovalorFinal'
  element :campoDescricaoInicial, '#descricaovalorInicial'
  element :campoDescricaoFinal, '#descricaovalorFinal'
  element :checkItemFiltrado, 'td > p-dtcheckbox > div > div.ui-chkbox-box'
  
  @@numero = Faker::Number.number(2)
  @@codigo = CONFIG['desc_abreviada'] + @@numero
  @@descricao = CONFIG['descricao'] + @@numero
  @@descricaoDepois = @@descricao + 'ALTERADO'
  @@centroCusto = 'TSTGC01 - TESTE GCC 01'

  def incluirGCC
    campoCodigo.set(@@codigo)
    campoDescricao.set(@@descricao)
    within(picklistDisponiveis) do
      campoPicklist.set(@@centroCusto)
    end
    botoes.clickSetaDireitaDupla
  end

  def pesquisarGCC
    campoCodigoInicial.set(@@codigo)
    campoCodigoFinal.set(@@codigo)
    campoDescricaoInicial.set(@@descricao)
    campoDescricaoFinal.set(@@descricao)
    botoes.clickButtonPesquisar
    checkItemFiltrado.click
  end

  def validarDetalharGCC
    within(picklistDisponiveis) do
      @campoCentroCusto = page.all(:css, 'ul')[1].text
    end
    @campoCodigo = campoCodigo.value
    @campoDescricao = campoDescricao.value
    @campoValores = {
      :campoCodigo => @campoCodigo,
      :campoDescricao => @campoDescricao,
      :campoCentroCusto => @campoCentroCusto,
      :codigoGCC => @@codigo,
      :descricaoGCC => @@descricao,
      :centroCusto => @@centroCusto
    }
  end

  def alterarGCC
    @@descricao = @@descricaoDepois
    campoDescricao.set(@@descricao)
    within(picklistDisponiveis) do
      campoPicklist.set('TSTGC0')
    end
    botoes.clickSetaDireitaDupla
  end
end