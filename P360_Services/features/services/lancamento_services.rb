class Lancamento
  include Savon
  include RSpec::Matchers

  def initialize(body, url)
    @options = {:body => body, :url => url}
  end

  def incluir_lancamento(token)
    client = Savon.client(wsdl: @options[:url])

    @response = client.call(
      :incluir, message: {        
        cabecalho: {
          token: token,
          empresa: '001'
        }, 
        poGrupoLancamentos: @options[:body]    
      }
    )
  end

  def validar_incluir_lancamento
    @resp = @response.body[:incluir_response][:incluir_result]
    @resp = @resp.split(/[,:{}(\[)(\])"]/)
    @resp = @resp.reject { |r| r.empty? }
    @lanc = Hash.new
    @include = @resp.include?("success")
    case @include
    when true
      @lanc[:sTipo] = @resp[-7]
      @lanc[:sMensagem] = @resp[-4]
    end
    @lanc   
  end
end