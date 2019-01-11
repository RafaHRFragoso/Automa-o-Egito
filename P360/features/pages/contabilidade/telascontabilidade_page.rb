# PAGE PARA TELAS DO MODULO CONTABILIDADE
class TelasContabilidadePage < SitePrism::Page
  element :menuPlanoContas, "a[id='01.01.01']"
  element :menuCentroCusto, "a[id='01.01.02']"
  element :telaGruposContabeis, "a[href*='/P360/contabilidade/grupocontabil']"
  element :telaGruposdeContasAuxiliares, "a[href*='/P360/contabilidade/grupocontaauxiliar']"
  element :telaContasAuxiliares, "a[href*='/P360/contabilidade/contaauxiliar']"
  element :telaContasContabeis, "a[href*='/P360/contabilidade/contacontabil']"
  element :telaCentroCusto, "a[href*='/P360/contabilidade/centrocusto']"
  element :telaGrupoCentroCusto, "a[href*='/P360/contabilidade/grupocentrocusto']"
  element :telaContaCentroCusto, "a[href*='/P360/contabilidade/contacentrocustocontaauxiliar']"
  element :telaHistoricoPadrao, "a[href*='/P360/contabilidade/historicopadrao']"
  element :telaLancamentoTipo, "a[href*='/P360/contabilidade/lancamentotipo']"
  element :telaLancamentoContabil, "a[href*='/P360/contabilidade/lancamentocontabil']"
  element :telaLancamentoAutomatico, "a[href*='/P360/contabilidade/lancamentoautomatico']"
  element :telaLancamentoAutorizacao, "a[href*='/P360/contabilidade/lancamentoautorizacao']"
  element :telaProvisaoTitulos, "a[href*='/P360/contabilidade/provisaotituloscompetencia']"
  element :telaReconhecimentoReceita, "a[href*='P360/contabilidade/reconhecimentoreceitacompetencia']"
  element :telaBalanceteRelatorio, "a[href*='/P360/contabilidade/balanceterelatorio']"
  element :telaRazao, "a[href*='/P360/contabilidade/razao']"
  element :telaDiario, "a[href*='/P360/contabilidade/diario']"

  def visitMenuCadastros
    # menuCadastros.click
    click_link 'Cadastros'
  end

  def visitMenuLancamentos
    click_link 'Lançamentos'
  end

  def visitMenuRelatorios
    click_link 'Relatórios'
  end

  def visitMenuPlanoContas
    menuPlanoContas.click
    # click_link 'Plano de Contas'
  end

  def visitMenuCentroCusto
    menuCentroCusto.click
    # click_link 'Centros de Custo'
  end

  def visitTelaGruposContabeis
    telaGruposContabeis.click
  end

  def visitTelaGruposdeContasAuxiliares
    telaGruposdeContasAuxiliares.click
  end

  def visitTelaContasAuxiliares
    telaContasAuxiliares.click
  end

  def visitTelaContasContabeis
    telaContasContabeis.click
  end

  def visitTelaCentroCusto
    telaCentroCusto.click
  end

  def visitTelaGrupoCentroCusto
    telaGrupoCentroCusto.click
  end

  def visitTelaContaCentroCusto
    telaContaCentroCusto.click
  end

  def visitTelaHistoricoPadrao
    telaHistoricoPadrao.click
  end

  def visitTelaLancamentoTipo
    telaLancamentoTipo.click
  end

  def visitTelaLancamentoContabil
    telaLancamentoContabil.click
  end

  def visitTelaLancamentoAutomatico
    telaLancamentoAutomatico.click
  end

  def visitTelaLancamentoAutorizacao
    telaLancamentoAutorizacao.click
  end

  def visitTelaProvisaoTitulos
    telaProvisaoTitulos.click
  end

  def visitTelaReconhecimentoReceita
    telaReconhecimentoReceita.click
  end

  def visitTelaBalanceteRelatorio
    telaBalanceteRelatorio.click
  end

  def visitTelaRazao
    telaRazao.click
  end

  def visitTelaDiario
    telaDiario.click
  end
end
