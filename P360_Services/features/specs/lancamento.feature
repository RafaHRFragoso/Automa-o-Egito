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
  
  @cadastrar
  Cenário: Cadastrar Lançamento
  Quando realizar uma requisição para cadastrar um lançamento
  Então a API irá retornar o status de sucesso na requisição
  E irá retornar dados válidos para o lançamento

  @consultar
  Cenário: Consultar Lançamento
  Quando realizar uma requisição para consultar um lançamento
  Então a API irá retornar o status de sucesso na requisição
  E irá retornar dados válidos para a consulta do lançamento

  @alterar
  Cenário: Alterar Lançamento
  Quando realizar uma requisição para alterar um lançamento
  Então a API irá retornar o status de sucesso na requisição
  E irá retornar dados válidos para a alteração do lançamento
  
  @excluir
  Cenário: Excluir Lançamento
  Quando realizar uma requisição para excluir um lançamento
  Então a API irá retornar o status de sucesso na requisição
  E irá retornar dados válidos para a exclusão do lançamento
