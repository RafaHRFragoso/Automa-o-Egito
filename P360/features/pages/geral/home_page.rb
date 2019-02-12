# PAGE DA PAGINA INICIAL
class HomePage < SitePrism::Page
  element :box_usuario, '#box-usuario'
  element :box_sair, '.box-sair'
  element :confirmar_empresa, "procenge-button[tipo='Sim']"
  element :confimar_modulo, "procenge-titulo[modulo='contabilidade']"

  def deslogar
    box_usuario.click
    box_sair.click
  end

  def setDropdown
    box_usuario.click
  end

  def setEmpresa(empresa)
    @empresa = empresa
    # puts "empresa passada no step: #{@empresa}"
    @empresa_atual = page.find('.box-info > h3').text
    # puts "empresa atual: #{@empresa_atual}"
    @posicao_icom = page.find('#box-info-usuario > div.box-empresas > ul > li:nth-child(31) > span').text
    # puts "empresa da posicao 31: #{@posicao_icon}"
    @primeira_empresa = page.find('#box-info-usuario > div.box-empresas > ul > li:first-child > span').text
    # puts "primeira empresa da lista: #{@primeira_empresa}"
    case @empresa
    when @empresa_atual
      puts "Empresa #{@empresa} já selecionada"
    when @posicao_icom
      sleep 1
      page.find('#box-info-usuario > div.box-empresas > ul > li:nth-child(31) > span').click
      @empresa = @posicao_icom
      confirmEmpresa
    when @primeira_empresa
      sleep 1
      page.find('#box-info-usuario > div.box-empresas > ul > li:first-child > span').click
      @empresa = 'AGROSSSSSSSSSSSSSSSS'
      confirmEmpresa
    else
      page.find('ul.lista-empresas', text: @empresa).click
      confirmEmpresa
    end
    @empresa
  end

  def confirmEmpresa
    @message_alert = page.has_text?('As informações da tela serão perdidas, deseja continuar?')
    case @message_alert
    when true
      confirmar_empresa.click
    end
  end
end
# PAGE DOS MODULOS
class ModulosPage < SitePrism::Page
  element :modulos, ".box-modulos"
  element :modulo_contabil, "a[href*='/P360/contabilidade/home']"

  def setModuloContabil
    within(modulos) do
      sleep 1
      modulo_contabil.click
    end
  end
end
