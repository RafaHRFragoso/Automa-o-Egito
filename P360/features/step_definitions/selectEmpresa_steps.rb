Quando("selecionar a empresa {string}") do |empresa|
  #pending # Write code here that turns the phrase above into concrete actions
  home.setDropdown
  home.setEmpresa(empresa)
  home.confirm_empresa
  page.assert_text(empresa)
end
