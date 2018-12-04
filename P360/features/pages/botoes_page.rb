# PAGE CLASSE DE BOTOES
class BotoesPage < SitePrism::Page
  element :button_incluir, "procenge-button[tipo='incluir']"
  element :button_alterar, "procenge-button[tipo='alterar']"
  element :button_detalhar, "procenge-button[tipo='detalhar']"
  element :button_excluir, "procenge-button[tipo='excluir']"
  element :button_imprimir, "procenge-button[tipo='imprimir']"
  element :button_voltar, "procenge-button[tipo='voltar']"
  element :button_salvar, "procenge-button[tipo='salvar']"
  # element :button_pesquisar, ""
  # element :button_limpar, ""

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
end
