#language:pt
@autenticar
Funcionalidade: Autenticar API SOAP
Com usuário e senha válidos
Uma requisição será realizada na API
A fim de validar o serviço de autenticar

  Cenário: Autenticar Com sucesso
  Quando realizar uma requisição para autenticar usuário
  Então a API irá retornar o status de sucesso na requisição
  E irá retornar dados válidos para a requisição

  Esquema do Cenario: Tentativa de Autenticação
  Quando realizar a autenticação com "<user>" e "<password>"
  Então a API irá retornar o status de sucesso na requisição
  E irá retornar o "<status>" e "<mensagem>" da autenticação

  Exemplos:
  | user      | password    | status | mensagem                            |
  | RAFAEL2   | senhaerrada | error  | Senha inválida.                     |
  | RAFAEL255 | senhapadrao | error  | Usuário não existe ou está inativo. |
  |           | senhapadrao | error  | Usuário não existe ou está inativo. |
  | RAFAEL2   |             | error  | Senha inválida.                     |
