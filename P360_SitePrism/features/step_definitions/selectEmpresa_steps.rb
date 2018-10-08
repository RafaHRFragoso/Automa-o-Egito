Quando("clicar no dropdown de seleção de empresa") do
    #pending # Write code here that turns the phrase above into concrete actions
    home.setDropdown
  end
  
  Quando("selecionar a empresa {string}") do |empresa|
    #pending # Write code here that turns the phrase above into concrete actions
    home.setEmpresa(empresa)
  end
  
  Então("devo aceitar o alerta de confirmação") do
    #pending # Write code here that turns the phrase above into concrete actions
    home.confirm_empresa
  end

  