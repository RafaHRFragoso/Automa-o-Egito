#language:pt

Funcionalidade: Login sem Sucesso
Para que a funcionalidade de login seja validada corretamente
Sendo um usuário
Não Posso acessar o sistema com email e/ou senha incorretos e/ou inexistentes.

    Contexto: Página Inicial
        Dado que eu acesso a página inicial
        Então a logo do sistema deve ser exibida
    @tag2
    Esquema do Cenario: Tentativa de login
        Quando eu faço login com "<user>" e "<senha>"
        Então devo ver a seguinte mensagem "<alerta>"

        Exemplos:
            | user      | senha       | alerta                                                                           |
            | RAFAEL2   | senhaerrada | Senha inválida. Solução: Informe uma senha válida.                               |
            | RAFAEL255 | senhapadrao | Usuário não existe ou está inativo. Solução: Informe um login de usuário válido. |
            |           | senhapadrao | Usuário não existe ou está inativo. Solução: Informe um login de usuário válido. |
            | RAFAEL2   |             | Senha inválida. Solução: Informe uma senha válida.                               |     

