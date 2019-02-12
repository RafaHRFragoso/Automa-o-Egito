### CADASTRO -> PLANO DE CONTAS ###
Quando('acessar a tela de Grupo Contábil') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuCadastros
  # clicar no submenu plano de contas
  telascontabil.visitMenuPlanoContas
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaGruposContabeis
end

Então('o sistema deve exibir a tela de Grupo Contábil') do
  # verificar se a tela entrou
  page.assert_text('Grupo de Contas')
end

Quando('acessar a tela de Grupos de Contas Auxiliares') do
  # selecionar modulo
  modulo.setModuloContabil
  # expect(page).to have_current_path('/P360/contabilidade/home')
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuCadastros
  # clicar no submenu plano de contas
  telascontabil.visitMenuPlanoContas
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaGruposdeContasAuxiliares
end

Então('o sistema deve exibir a tela de Grupos de Contas Auxiliares') do
  # verificacao se a tela entrou
  page.assert_text('Grupo de Conta Auxiliar')
end

Quando('acessar a tela de Contas Auxiliares') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuCadastros
  # clicar no submenu plano de contas
  telascontabil.visitMenuPlanoContas
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaContasAuxiliares
end

Então('o sistema deve exibir a tela de Contas Auxiliares') do
  # verificar se a tela entrou
  page.assert_text('Conta Auxiliar')
end

Quando('acessar a tela de Contas Contábeis') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuCadastros
  # clicar no submenu plano de contas
  telascontabil.visitMenuPlanoContas
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaContasContabeis
end

Então('o sistema deve exibir a tela de Contas Contábeis') do
  # verificar se a tela entrou
  page.assert_text('Contas Contábeis')
end

### CADASTRO -> CENTROS DE CUSTO ###

Quando('acessar a tela de Centros de Custo') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuCadastros
  # clicar no submenu plano de contas
  telascontabil.visitMenuCentroCusto
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaCentroCusto
end

Então('o sistema deve exibir a tela de Centros de Custo') do
  # verificar se a tela entrou
  page.assert_text('Centros de Custo')
end

Quando('acessar a tela de Grupos de Centro de Custo') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuCadastros
  # clicar no submenu plano de contas
  telascontabil.visitMenuCentroCusto
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaGrupoCentroCusto
end

Então('o sistema deve exibir a tela de Grupos de Centro de Custo') do
  page.assert_text('Grupos de Centro de Custo')
end

Quando('acessar a tela de Contas por Centro de Custo e Conta Auxilar') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuCadastros
  # clicar no submenu plano de contas
  telascontabil.visitMenuCentroCusto
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaContaCentroCusto
end

Então('o sistema deve exibir a tela de Contas por Centro de Custo e Conta Auxilar') do
  page.assert_text('Contas por Centro de Custo e Conta Auxilar')
end

### CADASTROS ###

Quando('acessar a tela de Histórico Padrão') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuCadastros
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaHistoricoPadrao
end

Então('o sistema deve exibir a tela de Histórico Padrão') do
  page.assert_text('Histórico Padrão')
end

Quando('acessar a tela de Tipo de Lançamento') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuCadastros
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaLancamentoTipo
end

Então('o sistema deve exibir a tela de Tipo de Lançamento') do
  page.assert_text('Tipo de Lançamento')
end

### LANCAMENTO ###

Quando('acessar a tela de Lançamento Normal') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuLancamentos
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaLancamentoContabil
end

Então('o sistema deve exibir a tela de Lançamento Normal') do
  page.assert_text('Lançamento Normal')
end

Quando('acessar a tela de Lançamento Automático') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuLancamentos
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaLancamentoAutomatico
end

Então('o sistema deve exibir a tela de Lançamento Automático') do
  page.assert_text('Lançamento Automático')
end

Quando('acessar a tela de Autorização de Lançamentos') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuLancamentos
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaLancamentoAutorizacao
end

Então('o sistema deve exibir a tela de Autorização de Lançamentos') do
  page.assert_text('Autorização de Lançamentos')
end

Quando('acessar a tela de Provisão de Títulos por Competência') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuLancamentos
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaProvisaoTitulos
end

Então('o sistema deve exibir a tela de Provisão de Títulos por Competência') do
  page.assert_text('Provisão de Títulos por Competência')
end

Quando('acessar a tela de Reconhecimento de Receita por Competência') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuLancamentos
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaReconhecimentoReceita
end

Então('o sistema deve exibir a tela de Reconhecimento de Receita por Competência') do
  page.assert_text('Reconhecimento de Receita por Competência')
end

### RELATORIOS ###

Quando('acessar a tela de Balancete') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuRelatorios
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaBalanceteRelatorio
end

Então('o sistema deve exibir a tela de Balancete') do
  page.assert_text('Balancete')
end

Quando('acessar a tela de Razão') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuRelatorios
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaRazao
end

Então('o sistema deve exibir a tela de Razão') do
  page.assert_text('Razão')
end

Quando('acessar a tela de Diário') do
  # selecionar modulo
  modulo.setModuloContabil
  expect(page).to have_current_path(telascontabil.path_contabilidade)
  # clicar no menu cadastros
  telascontabil.visitMenuRelatorios
  # clicar no link da tela de grupo contabeis
  telascontabil.visitTelaDiario
end

Então('o sistema deve exibir a tela de Diário') do
  page.assert_text('Diário')
end
