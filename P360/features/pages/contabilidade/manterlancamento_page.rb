class ManterLancamento < SitePrism::Page
  include Pages
  element :divData, 'procenge-calendar[identificador="dataCompetenciaInicial"]'
  element :campoData, '.ui-inputtext'
  element :campoDocumento, '#doc'
  element :divFilial, 'procenge-dropdown[identificador="filial"]'
  element :dropdownLC, '.ui-dropdown-label'
  element :campoFiltro, '.ui-dropdown-filter.ui-inputtext'
  element :itemFiltrado, '.ui-dropdown-items-wrapper'
  element :divTL, 'procenge-dropdown[identificador="tipo"]'
  # elementos Primeiro Débito 
  element :campoDebitoConta, '#campotabeladebito00'
  element :campoDebitoValor, '#campotabeladebito02'
  element :campoDebitoHistorico, '#campotabeladebito04'
  element :campoDebitoComplemento, '#campotabeladebito05'
  # elementos Segundo Débito 
  element :campoDebitoConta2, '#campotabeladebito10'
  element :campoDebitoValor2, '#campotabeladebito12'
  element :campoDebitoHistorico2, '#campotabeladebito14'
  element :campoDebitoComplemento2, '#campotabeladebito15'
  # elementos Primeiro Crédito
  element :campoCreditoConta, '#campotabelacredito00'
  element :campoCreditoValor, '#campotabelacredito02'
  element :campoCreditoHistorico, '#campotabelacredito04'
  element :campoCreditoComplemento, '#campotabelacredito05'
  # elementos Segundo Crédito
  element :campoCreditoConta2, '#campotabelacredito10'
  element :campoCreditoValor2, '#campotabelacredito12'
  element :campoCreditoHistorico2, '#campotabelacredito14'
  element :campoCreditoComplemento2, '#campotabelacredito15'
  # elementos Terceiro Crédito
  element :campoCreditoConta3, '#campotabelacredito20'
  element :campoCreditoValor3, '#campotabelacredito22'
  element :campoCreditoHistorico3, '#campotabelacredito24'
  element :campoCreditoComplemento3, '#campotabelacredito25'
  # elementos pesquisarLancamento
  element :dataInicial, '#dataCompetenciadataInicial'
  element :dataFinal, '#dataCompetenciadataFinal'
  element :valorInicial, '#valorvalorInicial'
  element :valorFinal, '#valorvalorFinal'
  element :documentoPesquisa, '#documentovalorInicial'
  element :divFiltro, '.ui-datatable-even:first-child'
  element :itemFiltro, 'div.ui-chkbox-box'
  # elemento validacao alterar detalhar
  element :valorTotalCredito, 'div.box-total div:nth-child(1) h3'
  element :valorTotalDebito, 'div.box-total div:nth-child(2) h3'

  @@conta = '1.1.1.01.222 - AUTOMACAO ANALITICA'
  @@valor = Faker::Number.number(2) + ','+ Faker::Number.number(2)
  @@valorAtualizado = Faker::Number.number(2) + ','+ Faker::Number.number(2)
  @@historico = '2019 - AUTOMACAO C/ COMPLEMENTO'
  @@documento = CONFIG['descricao']
  @@documentoAtualizado = @@documento + ' ' + CONFIG['alterado']
  @@complementoDebito = 'Automacao Debito'
  @@complementoDebitoAtualizado = @@complementoDebito + ' ' + CONFIG['alterado']
  @@complementoCredito = 'Automacao Credito'
  @@complementoCreditoAtualizado = @@complementoCredito + ' ' + CONFIG['alterado']
  @@valorDebAtualizado = '100,00'
  @@valorCredAtualizado = '50,00'
  @@valorDeb1 = '150,00'
  @@valorDeb2 =  '150,00'
  @@valorCred1 = '100,00'
  @@valorCred2 = '100,00'
  @@valorCred3 = '100,00'
  @@valorDebTotal =  @@valorDeb1.to_i + @@valorDeb2.to_i
  @@valorDebTotal = 'R$ ' + @@valorDebTotal.to_s + ',00'
  @@valorCredTotal = @@valorCred1.to_i + @@valorCred2.to_i + @@valorCred3.to_i
  @@valorCredTotal = 'R$ ' + @@valorCredTotal.to_s + ',00'
 
  def incluirLC(scenario_name)
    case scenario_name
    when 'Cadastrar Lancamento Com mais de um Debito e Credito Iguais'
      preencherLancamentoMulti(@@valorDeb1, @@valorDeb2, @@valorCred1, @@valorCred2, @@valorCred3)
    when 'Cadastrar Lancamento Com Debito e Credito Diferente'
      preencherLancamento(@@valor, @@valorAtualizado)
    when 'Cadastrar Lancamento Com mais de um Debito e Credito Diferentes'
      preencherLancamentoMulti(@@valorAtualizado, @@valorDeb2, @@valorCred1, @@valorCred2, @@valorCred3)
    end
  end

  # Metodo para preencher com 2 debitos e 3 Creditos
  def preencherLancamentoMulti(valorD1, valorD2, valorC1, valorC2, valorC3)
    preencherCabecalhoLancamento
    # INCLUSAO PRIMEIRO DEBITO 
    campoDebitoConta.send_keys(@@conta)
    sleep 1
    campoDebitoConta.send_keys :down
    campoDebitoConta.send_keys :enter
    campoDebitoValor.set(valorD1)
    campoDebitoHistorico.set(@@historico)
    sleep 1
    campoDebitoHistorico.send_keys :down
    campoDebitoHistorico.send_keys :enter
    campoDebitoComplemento.set(@@complementoDebito)
    click_button('Adicionar Débito')
    # INCLUSAO SEGUNDO DEBITO 
    campoDebitoConta2.send_keys(@@conta)
    sleep 1
    campoDebitoConta2.send_keys :down
    campoDebitoConta2.send_keys :enter
    campoDebitoValor2.set(valorD2)
    campoDebitoHistorico2.set(@@historico)
    sleep 1
    campoDebitoHistorico2.send_keys :down
    campoDebitoHistorico2.send_keys :enter
    campoDebitoComplemento2.set(@@complementoDebito)
    # INCLUSAO PRIMEIRO CREDITO
    campoCreditoConta.send_keys(@@conta)
    sleep 1
    campoCreditoConta.send_keys :down
    campoCreditoConta.send_keys :enter
    campoCreditoValor.set(valorC1)
    campoCreditoHistorico.set(@@historico)
    sleep 1
    campoCreditoHistorico.send_keys :down
    campoCreditoHistorico.send_keys :enter
    campoCreditoComplemento.set(@@complementoCredito)
    click_button('Adicionar Crédito')
    # INCLUSAO SEGUNDO CREDITO
    campoCreditoConta2.send_keys(@@conta)
    sleep 1
    campoCreditoConta2.send_keys :down
    campoCreditoConta2.send_keys :enter
    campoCreditoValor2.set(valorC2)
    campoCreditoHistorico2.set(@@historico)
    sleep 1
    campoCreditoHistorico2.send_keys :down
    campoCreditoHistorico2.send_keys :enter
    campoCreditoComplemento2.set(@@complementoCredito)
    click_button('Adicionar Crédito')
    # INCLUSAO TERCEIRO CREDITO
    campoCreditoConta3.send_keys(@@conta)
    sleep 1
    campoCreditoConta3.send_keys :down
    campoCreditoConta3.send_keys :enter
    campoCreditoValor3.set(valorC3)
    campoCreditoHistorico3.set(@@historico)
    sleep 1
    campoCreditoHistorico3.send_keys :down
    campoCreditoHistorico3.send_keys :enter
    campoCreditoComplemento3.set(@@complementoCredito)
  end
  # Metodo para preencher com debito e credito unico
  def preencherLancamento(valorDeb, valorCred)
    preencherCabecalhoLancamento
    # INCLUSAO DEBITO
    campoDebitoConta.send_keys(@@conta)
    sleep 1
    campoDebitoConta.send_keys :down
    campoDebitoConta.send_keys :enter
    campoDebitoValor.set(valorDeb)
    campoDebitoHistorico.set(@@historico)
    sleep 1
    campoDebitoHistorico.send_keys :down
    campoDebitoHistorico.send_keys :enter
    campoDebitoComplemento.set(@@complementoDebito)
    # INCLUSAO CREDITO
    campoCreditoConta.send_keys(@@conta)
    sleep 1
    campoCreditoConta.send_keys :down
    campoCreditoConta.send_keys :enter
    campoCreditoValor.set(valorCred)
    campoCreditoHistorico.set(@@historico)
    sleep 1
    campoCreditoHistorico.send_keys :down
    campoCreditoHistorico.send_keys :enter
    campoCreditoComplemento.set(@@complementoCredito)
  end

  def preencherCabecalhoLancamento
    within(divFilial) do
      dropdownLC.click
      campoFiltro.set('001 - ICOM COMÉRCIO E INDÚSTRIA LTDA - SP')
      itemFiltrado.click
    end
    within(divTL) do
      dropdownLC.click
      campoFiltro.set('AU - AUTOMACAO')
      itemFiltrado.click
    end
    within(divData) do
      campoData.send_keys :clear
      campoData.set('30122018')
      campoData.send_keys :tab
    end
    campoDocumento.set(@@documento)
  end

  def pesquisarLC(status)
    @status = status
    dataInicial.set('30122018')
    dataFinal.send_keys :tab
    dataFinal.set('30122018')
    dataInicial.send_keys :tab
    case @status
    when 'incluir'
      documentoPesquisa.set(@@documento)
      valorInicial.set(@@valorDeb1)
      valorFinal.set(@@valorDeb1)
    when 'excluir'
      documentoPesquisa.set(@@documentoAtualizado)
      valorInicial.set(@@valorDebAtualizado)
      valorFinal.set(@@valorDebAtualizado)
    end
    botoes.clickButtonPesquisar
    within(divFiltro) do
      itemFiltro.click
    end
  end

  def validarDetalharLC
    @campoValorDebito = campoDebitoValor.value
    @campoValorDebito2 = campoDebitoValor2.value
    @campoValorCredito = campoCreditoValor.value
    @campoValorCredito2 = campoCreditoValor2.value
    @campoValorCredito3 = campoCreditoValor3.value
    @campoDocumento = campoDocumento.value
    @complementoDeb = campoDebitoComplemento.value
    @complementoCred = campoCreditoComplemento.value
    @campoValorDebitoTotal = valorTotalDebito.text
    @campoValorCreditoTotal = valorTotalCredito.text
    @campoValores = {
      :campoValorDebito => @campoValorDebito,
      :valorDebito => @@valorDeb1,
      :campoValorDebito2 => @campoValorDebito2,
      :valorDebito2 => @@valorDeb2,
      :campoValorCredito => @campoValorCredito,
      :valorCredito => @@valorCred1,
      :campoValorCredito2 => @campoValorCredito2,
      :valorCredito2 => @@valorCred2,
      :campoValorCredito3 => @campoValorCredito3,
      :valorCredito3 => @@valorCred3,
      :valorDebitoTotal => @@valorDebTotal,
      :campoValorDebitoTotal => @campoValorDebitoTotal,
      :valorCreditoTotal => @@valorCredTotal,
      :campoValorCreditoTotal => @campoValorCreditoTotal,
      :campoDocumentoTela => @@documento,
      :campoDocumento => @campoDocumento,
      :campoComplementoDebitoTela => @@complementoDebito,
      :campoComplementoCreditoTela => @@complementoCredito,
      :campoComplementoDebito => @complementoDeb,
      :campoComplementoCredito => @complementoCred
    }
  end
 
  def alterarLC
    campoDocumento.set(@@documentoAtualizado)
    campoDebitoComplemento.set(@@complementoDebitoAtualizado)
    campoCreditoComplemento.set(@@complementoCreditoAtualizado)
    campoDebitoValor.set(@@valorDebAtualizado)
    campoCreditoValor.set(@@valorCredAtualizado)
  end
end