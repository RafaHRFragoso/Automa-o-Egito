# MODULO PARA TIRAR SCREENSHOT DA TELA
module Helper
  def tirar_foto(scenario_name, resultado)
    path_file = "reports/screenshots/test_#{resultado}"
    screenshot = "#{path_file}/#{scenario_name}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Evidencia')
  end
end
