# PAGE CLASSE DE BOTOES
class BotoesPage < SitePrism::Page
  element :button_incluir, "procenge-button[tipo='incluir']"
  element :button_alterar, "procenge-button[tipo='alterar']"
  element :button_detalhar, "procenge-button[tipo='detalhar']"
  element :button_excluir, "procenge-button[tipo='excluir']"
  element :button_imprimir, "procenge-button[tipo='imprimir']"
  element :button_voltar, "procenge-button[tipo='voltar']"
  element :button_salvar, "procenge-button[tipo='salvar']"
  element :button_salvar_criar_novo, "procenge-button[tipo='Salvar e Criar Novo']"
  element :button_adicionar, "procenge-button[tipo='adicionar']"
  element :button_sim, "procenge-button[tipo='Sim']"
  element :seta_esquerda, '.fa-angle-left'
  element :seta_esquerda_dupla, '.fa-angle-double-left'
  element :seta_direita, '.fa-angle-right'
  element :seta_direita_dupla, '.fa-angle-double-right'
  element :splitButton, '.ui-splitbutton-menubutton.ui-button-icon-only'

  def clickButtonIncluir
    button_incluir.click
  end

  def clickButtonAlterar
    button_alterar.click
  end

  def clickButtonDetalhar
    button_detalhar.click
  end

  def clickButtonExcluir
    button_excluir.click
  end

  def clickButtonPesquisar
    # button_limpar.click
    click_button 'Pesquisar'
  end

  def clickButtonLimpar
    # button_pesquisar.click
    click_button 'Limpar'
  end

  def clickButtonImprimir
    button_imprimir.click
  end

  def clickButtonVoltar
    button_voltar.click
  end

  def clickButtonSalvar
    button_salvar.click
  end
  def clickButtonSalvarCriarNovo
    button_salvar_criar_novo.click
  end

  def clickButtonAdicionar
    button_adicionar.click
  end
# verificar com rafael se o click no sim deve entrar junto com o excluir
  def clickButtonSim
    button_sim.click
  end

  def clickButtonAdicionarOrigem
    click_button 'Adicionar Origem'
  end

  def clickButtonAssociarCentroCusto
    click_button 'Associar Centros de Custo'
  end

  def clickSetaEsquerda
    seta_esquerda.click
  end

  def clickSetaEsquerdaDupla
    seta_esquerda_dupla.click
  end

  def clickSetaDireita
    seta_direita.click
  end

  def clickSetaDireitaDupla
    seta_direita_dupla.click
  end

  def clickSplitButton
    splitButton.click
  end
end
