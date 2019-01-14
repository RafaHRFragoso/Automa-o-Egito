class Lancamento
  include Savon
  include RSpec::Matchers

  @@lanc = Hash.new

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

  def consultar_lancamento(token)
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

  def alterar_lancamento(token)
    client = Savon.client(wsdl: @options[:url])
       
    @response = client.call(
      :alterar, message: {        
        cabecalho: {
          token: token,
          empresa: '001'
        }, 
        poGrupoLancamentos: @options[:body]    
      }
    )
  end

  def excluir_lancamento(token)
    client = Savon.client(wsdl: @options[:url])
       
    @response = client.call(
      :excluir, message: {        
        cabecalho: {
          token: token,
          empresa: '001'
        }, 
        poLancamento: @options[:body]    
      }
    )
  end

  def validar_incluir_lancamento
    @resp = @response.body[:incluir_response][:incluir_result]
    @resp = @resp.split(/[,:{}(\[)(\])"]/)
    @resp = @resp.reject { |r| r.empty? }
    # puts @resp
    @include = @resp.include?("success")
    case @include
    when true
      @@lanc[:sTipo] = @resp[-7]
      @@lanc[:sMensagem] = @resp[-4].chop
      @@lanc[:cod_lanc_deb] = @resp[25]
      @@lanc[:cod_lanc_cred] = @resp[62]
      @@lanc[:grupo_lanc] = @resp[4]
    when false
      @@lanc[:sTipo] = @resp[3]
      @@lanc[:sMensagem] = @resp[6]
    end
    @@lanc   
  end

  def pegar_lancamento
    @@lanc
  end

  def validar_alterar_lancamento
    @resp = @response.body[:alterar_response][:alterar_result]
    @resp = @resp.split(/[,:{}(\[)(\])"]/)
    @resp = @resp.reject { |r| r.empty? }
    # puts @resp
    @include = @resp.include?("success")
    case @include
    when true
      @@lanc[:sTipo] = @resp[-7]
      @@lanc[:sMensagem] = @resp[-4].chop
    # when false
    #   @@lanc[:sTipo] = @resp[2]
    #   @@lanc[:sMensagem] = @resp[5].chop
    end
    @@lanc   
  end

  def validar_excluir_lancamento
    @resp = @response.body[:excluir_response][:excluir_result]
    @resp = @resp.split(/[,:{}(\[)(\])"]/)
    @resp = @resp.reject { |r| r.empty? }
    # puts @resp
    @include = @resp.include?("success")
    case @include
    when true
      @@lanc[:sTipo] = @resp[2]
      @@lanc[:sMensagem] = @resp[5].chop
    when false
      @@lanc[:sTipo] = @resp[2]
      @@lanc[:sMensagem] = @resp[5].chop
    end
    @@lanc   
  end
end