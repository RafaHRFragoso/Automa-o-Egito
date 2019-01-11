class ManterHistoricoPadrao < SitePrism::Page
  # elementos para o metodo preencherCampos
  element :comboCodigo, 'input[id="codigo"]'
  element :comboHistorico, 'input[id="historico"]'
  element :boxTemComplemento, 'div[class="ui-chkbox-box ui-widget ui-corner-all ui-state-default"]'
  element :listaComplemento, 'input[id="campotabelacomplemento00"]'
  element :complementoFiltrado, 'div:nth-child(1) > p-autocomplete > span > div > ul > li > span'
  element :adicionarComplemento, 'div > div.tr.ng-star-inserted > div:nth-child(2) > a'
  element :tipoComplemento, 'div.ui-listbox-list-wrapper > ul > li:nth-child(13) > span'
  element :focoDescricao, 'procenge-inputtextarea[identificador="descricao"]'
  element :descricaoComplemento, 'textarea'
   # elementos para o metodo pesquisarHP
  element :codigoInicial, 'Input[id="codigoinicial"]'
  element :codigoFinal, 'Input[id="codigofinal"]'
  element :descInicial, 'Input[id="descricaoinicial"]'
  element :descFinal, 'Input[id="descricaofinal"]'
  # elementos para o metodo detalharHP
  element :boxElemento, 'td > p-dtcheckbox > div > div.ui-chkbox-box'

    @@valorHistorico = Faker::DragonBall.character
    @@valorHistoricoAlterado = Faker::DragonBall.character
    @@valorCodigo = 'T' + Faker::Number.number(3) 

    $valorCodigoDetalhar = @@valorCodigo
    $valorHistoricoDetalhar = @@valorHistorico

  def preencherCampos()
  # preenchendo o campo código
    comboCodigo.set(@@valorCodigo)
  # preenchendo o campo historico
    comboHistorico.set(@@valorHistorico)
  # marcando a opção de complemento
    boxTemComplemento.click
  # clicando no botao de adicionar origem
    click_button 'Adicionar Origem'
  # inserindo o valor "CAIXA" para filtrar
    listaComplemento.set('CAIXA')
  # clicando no valor filtrado
    complementoFiltrado.click
  # clicando em adicionar complemento
    adicionarComplemento.click
  # clique no complemento de valor : "Numero do documento"
    tipoComplemento.click
  # adicionando descrição
    within(focoDescricao) do
      descricaoComplemento.set('Automacao')
    end
  # clicando no botao adicionar
    click_button 'Adicionar'
  end

  def pesquisarHP(status)
    #@status = status
    case status
      when 'incluido'
        codigoInicial.set(@@valorCodigo)
        codigoFinal.set(@@valorCodigo)
        descInicial.set(@@valorHistorico)
        descFinal.set(@@valorHistorico)
        click_button 'Pesquisar'
      when 'alterado'
        codigoInicial.set(@@valorCodigo)
        codigoFinal.set(@@valorCodigo)
        descInicial.set(@@valorHistoricoAlterado)
        descFinal.set(@@valorHistoricoAlterado)
        click_button 'Pesquisar'
    end
  end

  def detalharHP()
    boxElemento.click
    click_button 'Detalhar'
  end

  def verificarInfo()
    @campos = Hash.new

    @campos[:campoCodigo] = page.find('#codigo').value
    @campos[:campoHistorico] = page.find('#historico').value
    
    puts @campos
    return @campos 
  end 

  def selecionarAlterarHP()
    boxElemento.click
    click_button 'Alterar'
  end

  def alterarHP()
    comboHistorico.set(@@valorHistoricoAlterado)
  end

  def excluirHP()
    boxElemento.click
  end
 end