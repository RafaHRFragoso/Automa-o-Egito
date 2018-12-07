# MODULO PARA TIRAR SCREENSHOT DA TELA
module Helper
  def printScreenshot(scenario_name, resultado)
    timer_path = Time.now.strftime('%F').to_s
    path_file = "reports/screenshots/test_#{resultado}/run_#{timer_path}"
    screenshot = "#{path_file}/#{scenario_name}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Evidencia')
  end
end
