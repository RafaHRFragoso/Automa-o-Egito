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

  def cadgrupocontaaux
    @cadgrupocontaaux ||= CadGrupoContaAux.new
  end

  def cadcentrocusto
    @cadcentrocusto ||= CadCentroCusto.new
  end
end
