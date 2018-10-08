#language:pt

Funcionalidade: Login
Para que eu possa utilizar as funcionalidades do sistema
Sendo um usuário
Posso acessar o sistema com email e senha previamente cadastrados.

    Contexto: Página Inicial
        Dado que eu acesso a página inicial

    @logout
    Cenario: Usuario deve ser autorizado
        
        Quando eu faço login com "RAFAEL2" e "PIRAMIDE"
        Então deve ser autenticado com sucesso
        E vai ter um seletor css com o texto "RAFAEL"

    
    Esquema do Cenario: Tentativa de login
        Quando eu faço login com "<user>" e "<senha>"
        Então devo ver a seguinte mensagem "<alerta>"

        Exemplos:
            | user      | senha       | alerta                                                                           |
            | RAFAEL2   | senhaerrada | Senha inválida. Solução: Informe uma senha válida.                               |
            | RAFAEL255 | senhapadrao | Usuário não existe ou está inativo. Solução: Informe um login de usuário válido. |
            |           | senhapadrao | Usuário não existe ou está inativo. Solução: Informe um login de usuário válido. |
            | RAFAEL2   |             | Senha inválida. Solução: Informe uma senha válida.                               |     

