Before '@lancamento' do

  @body = {
      'EMPRESA' => '001',
      'FILIAL' => '001',
      'DOCNO' => 'brsoap',
      'LDATA' => '31-08-2018',
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

  @autenticar_url = 'wsLANCAMENTO.asmx?wsdl'
  @url_service = @base_url + @autenticar_url
  @lancamento = Lancamento.new(@body, @url_service)

end