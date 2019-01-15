class ManterContaAux < SitePrism::Page
  include RSpec::Matchers
  element :dropdown, 'procenge-dropdown > div > p-dropdown > div > label'
  element :boxDrop, 'input[class="ui-dropdown-filter ui-inputtext ui-widget ui-state-default ui-corner-all"]'
  element :clienteFiltroIncluir, '.ng-tns-c17-17.ui-dropdown-item'
  element :clienteFiltroPesquisar, '.ng-tns-c12-7.ui-dropdown-item'
  element :boxCodigo, 'input[id="codigo"]'
  element :boxDescricao, 'input[id="descricao"]'
  element :boxCodigoInicial, '#containicial'
  element :boxCodigoFinal, '#contaFinal'
  element :boxDescricao, '#descricao' 
  element :flagConta, 'td > p-dtcheckbox > div > div.ui-chkbox-box'
 
  @@codigoPesquisa = Faker::Number.number(4)
  @@descricaoInicial = Faker::LeagueOfLegends.champion
  @@descricaoFinal = Faker::LeagueOfLegends.champion

  def incluirCA
    dropdown.click
    boxDrop.set('0001 - CLIENTES')
    clienteFiltroIncluir.click
    boxCodigo.set(@@codigoPesquisa)
    boxDescricao.set(@@descricaoInicial)
  end

  #def filtrarContaAux()
  #  dropdown.click
  #  boxDrop.set('0001 - CLIENTES')
  #  clienteFiltroPesquisar.click
  #  boxCodigoInicial.set(@@codigoPesquisa)
  #  boxCodigoFinal.set(@@codigoPesquisa)
  #  click_button 'Pesquisar'
  #end

def pesquisarCA(status)
  @status = status
  dropdown.click
  boxDrop.set('0001 - CLIENTES')
  clienteFiltroPesquisar.click
  boxCodigoInicial.set(@@codigoPesquisa)
  boxCodigoFinal.set(@@codigoPesquisa)
  case @status
  when 'incluida'
    boxDescricao.set(@@descricaoInicial)
  when 'alterada'
    boxDescricao.set(@@descricaoFinal)  
  end
  click_button 'Pesquisar'  
  flagConta.click
end

  def acessarCA()
    click_button 'Alterar'
  end

  def alterarCA()
    boxDescricao.set(@@descricaoFinal)
  end

  def verificarDetalhamento()
    @campoCodigo = page.find('#codigo').value
    @campoDescricao = page.find('#descricao').value
    ###
    puts 'Campos a serem comparados'
    puts @campoCodigo, @campoDescricao 
    puts ''
    puts 'Campos com valores exatos'
    puts @@codigoPesquisa, @@descricaoInicial
    ###
    expect(@campoCodigo).to eql(@@codigoPesquisa)
    expect(@campoDescricao).to eql(@@descricaoInicial)
  end

  def excluirCA()
    flagConta.click 
  end

end