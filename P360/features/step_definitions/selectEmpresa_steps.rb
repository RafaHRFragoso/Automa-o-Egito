Quando('selecionar a empresa {string}') do |empresa|
  home.setDropdown
  home.setEmpresa(empresa)
  home.confirm_empresa
  page.assert_text(empresa)
  expect(page).to have_content(empresa)
end
