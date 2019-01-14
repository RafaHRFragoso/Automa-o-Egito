Before '@lancamento' do |scenario|

  @autenticar_url = 'wsLANCAMENTO.asmx?wsdl'
  @url_service = @base_url + @autenticar_url
  # @timer_path = Time.now.strftime("%d/%m/%Y").to_s
  @timer_path = '31-12-2018'
  puts scenario.name

  case scenario.name
  when 'Cadastrar Lançamento'
    @body = {
        'EMPRESA' => '001',
        'FILIAL' => '001',
        'DOCNO' => 'brsoap',
        'LDATA' => @timer_path,
        'CTIPO' => 'C',
        'CODORIGEM' => '09',
        'COD_ARQUIVO' => 'BRSOAP',
        'COD_VERSAO' => '0',
        'DEBITOS' => {
          'fc_DEBCRELANCAMENTO_dados' => {
            'CONTA' => '1.1.1.01.004',
            'CODHIST' => 'EME3',
            'UNIDADE' => '01',
            'VALOR' => '100'
          }
        },
        'CREDITOS' => {
          'fc_DEBCRELANCAMENTO_dados' => {
            'CONTA' => '1.1.1.01.004',
            'CODHIST' => 'EME3',
            'UNIDADE' => '01',
            'VALOR' => '100'
          }        
        }  
      }
  when 'Consultar Lançamento'
    @lancamento = Lancamento.new(@body, @url_service)
    @lanc = @lancamento.pegar_lancamento
    # puts @lanc   
  when 'Alterar Lançamento'
    @lancamento = Lancamento.new(@body, @url_service)
    @lanc = @lancamento.pegar_lancamento
    @body = {
      'EMPRESA' => '001',
      'GRUPO_LANC' => @lanc[:grupo_lanc],
      'FILIAL' => '001',
      'DOCNO' => 'AUT2018',
      'LDATA' => @timer_path,
      'CTIPO' => 'C',
      'CODORIGEM' => '03',
      'COD_ARQUIVO' => 'BRSOAP',
      'COD_VERSAO' => '0',
      'DEBITOS' => {
        'fc_DEBCRELANCAMENTO_dados' => {
          'CODLANC' => @lanc[:cod_lanc_deb],
          'CONTA' => '1.1.1.01.001',
          'CODHIST' => 'D001',
          'UNIDADE' => '000',
          'COMPLEMENTO' => 'AUTOMAÇÃO',
          'VALOR' => '300'
        }
      },
      'CREDITOS' => {
        'fc_DEBCRELANCAMENTO_dados' => {
          'CODLANC' => @lanc[:cod_lanc_cred],
          'CONTA' => '1.1.1.01.001',
          'CODHIST' => 'D001',
          'UNIDADE' => '000',
          'COMPLEMENTO' => 'AUTOMAÇÃO',
          'VALOR' => '300'
        }        
      }  
    }
  when 'Excluir Lançamento'
    @lancamento = Lancamento.new(@body, @url_service)
    @lanc = @lancamento.pegar_lancamento
    @body = {
        'EMPRESA' => '001',
        'GRUPO_LANC' => @lanc[:grupo_lanc],
        'FILIAL' => '001',
        'LDATA' => @timer_path,
        'COD_VERSAO' => '0'    
      }
  end
  @lancamento = Lancamento.new(@body, @url_service)
end