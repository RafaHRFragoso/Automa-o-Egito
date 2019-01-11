#language:pt
@login
Funcionalidade: Realizar Login 
Para que eu possa utilizar as funcionalidades do sistema
Sendo um usuário
Posso acessar o sistema com email e senha previamente cadastrados.

    Contexto: Página Inicial
        Dado que o usuário acesse a página inicial
        Então a logo do sistema deve ser exibida
        
    @logout @templogin
    Cenario: Login com Sucesso
        Quando o usuário realizar o login
        Então deve ser autenticado com sucesso
        
    @loginFailed
    Esquema do Cenario: Tentativa de login
        Quando logar com "<user>" e "<senha>"
        Então devo ver a seguinte mensagem "<alerta>"

        Exemplos:
            | user      | senha       | alerta                                                                           |
            | RAFAEL2   | senhaerrada | Senha inválida. Solução: Informe uma senha válida.                               |
            | RAFAEL255 | senhapadrao | Usuário não existe ou está inativo. Solução: Informe um login de usuário válido. |
            |           | senhapadrao | Usuário não existe ou está inativo. Solução: Informe um login de usuário válido. |
            | RAFAEL2   |             | Senha inválida. Solução: Informe uma senha válida.                               |
