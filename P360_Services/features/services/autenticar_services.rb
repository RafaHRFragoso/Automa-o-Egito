class Autenticar
  include Savon
  include RSpec::Matchers

  def initialize(body, url)
    @options = {:body => body, :url => url}
  end

  def post_autenticar
    client = Savon.client(
      wsdl: @options[:url]
      )

    @response = client.call(
      :autenticar, message: {
        poAutenticar: @options[:body]
      }
    )
  end

  def post_autenticar_failed(user,password)
    client = Savon.client(
      wsdl: @options[:url]
      )

    @response = client.call(
      :autenticar, message: {
        poAutenticar: {
          'LOGIN' => user,
          'SENHA' => password
        }
      }
    )
  end

  def validar_login
    @resp = @response.body[:autenticar_response][:autenticar_result]
    @resp = @resp.split(/[,:{}(\[)(\])"]/)
    @resp = @resp.reject { |r| r.empty? }
    # puts @resp
    @include = @resp.include?("success")
    # puts @include
    # @position = @resp.index("sTipo")
    # puts @position
    @asserts = Hash.new
    case @include
    when true
      @asserts[:sTipo] = @resp[5]
      @asserts[:sMensagem] = @resp[8]
      @asserts[:token] = @resp[2]
      # expect(@asserts[:sTipo]).to eq("success")
      # expect(@asserts[:sMensagem]).to eq("Autenticação realizada com sucesso.")
    else
      @asserts[:sTipo] = @resp[4]
      @asserts[:sMensagem] = @resp[7]
      @asserts[:token] = @resp[2]
      # expect(@asserts[:sTipo]).to eq("error")
      # expect(@asserts[:sMensagem]).to eq("Autenticação realizada com sucesso.")  
    end
    @asserts
  end
end