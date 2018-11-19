module Helper

    def tirar_foto(scenario_name, resultado)
        path_file = "log/screenshots/test_#{resultado}"
        screenshot = "#{path_file}/#{scenario_name}.png"
        page.save_screenshot(screenshot) 
        embed(screenshot, 'image/png', 'Evidencia')
    end
    
end
