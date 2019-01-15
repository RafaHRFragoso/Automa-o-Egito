class ManterTipoLancamento < SitePrism::Page
  include RSpec::Matchers
  element :codigo, 'input[id="codigoLancamento"]'
  element :descricao, 'input[id="descricaoLancamento"]'
  element :codInicial, 'input[id="codigoInicialLancamento"]'
  element :codFinal, 'input[id="codigoFinalLancamento"]'
  element :boxItemFiltrado, 'td > p-dtcheckbox > div > div.ui-chkbox-box'
  element :descricaoInicial, 'input[id="descricaoInicialLancamento"]'
  element :descricaoFinal, 'input[id="descricaoFinalLancamento"]'

  @@codigoLancamento= Faker::Science.element_symbol
  @@descricaoAntes = Faker::Science.element
  @@descricaoDepois = Faker::Science.element

  def incluirTL
    codigo.set(@@codigoLancamento)
    descricao.set(@@descricaoAntes)
  end

  def pesquisarTL(status)
    @status = status
    codInicial.set(@@codigoLancamento)
    codFinal.set(@@codigoLancamento)
    case @status
    when 'incluido'
      descricaoInicial.set(@@descricaoAntes)
      descricaoFinal.set(@@descricaoAntes)
    when 'alterado'
      descricaoInicial.set(@@descricaoDepois)
      descricaoFinal.set(@@descricaoDepois)
    end
    click_button 'Pesquisar'
    boxItemFiltrado.click
  end

  def detalharTL
    click_button 'Detalhar'
  end

  def alterarTL
    descricao.set(@@descricaoDepois)
  end

  def validarInfoTL
    @primeiroCampo = page.find('#codigoLancamento').value
    @segundoCampo = page.find('#descricaoLancamento').value

    # validacao
    expect(@primeiroCampo).to eql(@@codigoLancamento)
    expect(@segundoCampo).to eql(@@descricaoAntes)
  end
end