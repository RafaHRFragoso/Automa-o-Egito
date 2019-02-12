class ManterTipoLancamento < SitePrism::Page
  include Pages
  element :campoCodigo, 'input[id="codigoLancamento"]'
  element :campoDescricao, 'input[id="descricaoLancamento"]'
  element :campoCodigoInicial, 'input[id="codigolancamentotipovalorInicial"]'
  element :campoCodigoFinal, 'input[id="codigolancamentotipovalorFinal"]'
  element :checkItemFiltrado, 'td > p-dtcheckbox > div > div.ui-chkbox-box'
  element :campoDescricaoInicial, 'input[id="descricaolancamentotipovalorInicial"]'
  element :campoDescricaoFinal, 'input[id="descricaolancamentotipovalorFinal"]'

  @@codigoLancamento= Faker::Number.number(2)
  @@descricaoAntes = CONFIG['descricao'] + @@codigoLancamento
  @@descricaoDepois = CONFIG['descricao'] + Faker::Number.number(2)

  def incluirTL
    campoCodigo.set(@@codigoLancamento)
    campoDescricao.set(@@descricaoAntes)
  end

  def pesquisarTL(status)
    @status = status
    campoCodigoInicial.set(@@codigoLancamento)
    campoCodigoFinal.set(@@codigoLancamento)
    case @status
    when 'incluir'
      campoDescricaoInicial.set(@@descricaoAntes)
      campoDescricaoFinal.set(@@descricaoAntes)
    when 'excluir'
      campoDescricaoInicial.set(@@descricaoDepois)
      campoDescricaoFinal.set(@@descricaoDepois)
    end
    botoes.clickButtonPesquisar
    checkItemFiltrado.click
  end

  def alterarTL
    campoDescricao.set(@@descricaoDepois)
  end

  def validarDetalharTL
    @campoCodigo = campoCodigo.value
    @campoDescricao = campoDescricao.value
    @campoValores = {
      :campoCodigo => @campoCodigo,
      :campoDescricao => @campoDescricao,
      :codigoLancamento => @@codigoLancamento,
      :descricaoAntes => @@descricaoAntes
    }
  end
end
