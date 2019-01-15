Dir[File.join(File.dirname(__FILE__),
              '../pages/*_page.rb')].each { |file| require file }

# MODULO QUE INSTANCIA AS CLASSES DOS PAGE OBJECTS
module Pages
  def login
    @login ||= LoginPage.new
  end

  def home
    @home ||= HomePage.new
  end

  def modulo
    @modulo ||= ModulosPage.new
  end

  def botoes
    @botoes ||= BotoesPage.new
  end

  def telascontabil
    @telascontabil ||= TelasContabilidadePage.new
  end

  def mantergrupocontaaux
    @mantergrupocontaaux ||= ManterGrupoContaAux.new
  end

  def cadcentrocusto
    @cadcentrocusto ||= CadCentroCusto.new
  end

  def manterhistoricopadrao
    @manterhistoricopadrao ||= ManterHistoricoPadrao.new
  end

  def mantertipolancamento
    @mantertipolancamento ||= ManterTipoLancamento.new
  end

  def mantercontaaux
    @mantercontaaux ||= ManterContaAux.new
  end

  def auxiliares
    @auxiliares ||= Auxiliares.new
  end
 
end
