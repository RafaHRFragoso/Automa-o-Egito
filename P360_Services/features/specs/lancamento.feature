#language:pt
@lancamento
Funcionalidade: Manter Lançamento Contábil através da API
Com um token válido
Uma requisição será realizada na API
A fim de validar o serviço de inclusão de lançamento contábil
 
  Contexto: Gerar Token de Autenticação
  Quando realizar uma requisição para autenticar usuário
  Então a API irá retornar o status de sucesso na requisição
  E irá retornar dados válidos para a requisição

  Cenário: Cadastrar Lançamento
  Quando realizar uma requisição para cadastrar um lançamento
  Então a API irá retornar o status de sucesso na requisição
  E irá retornar dados válidos para o lançamento

