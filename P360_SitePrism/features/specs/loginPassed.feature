#language:pt

Funcionalidade: Login com Sucesso
Para que eu possa utilizar as funcionalidades do sistema
Sendo um usuário
Posso acessar o sistema com email e senha previamente cadastrados.

    Contexto: Página Inicial
        Dado que eu acesso a página inicial
        Então a logo do sistema deve ser exibida
        
    #@tag1
    #@logout
    Cenario: Usuario deve ser autorizado
        
        Quando eu faço login com "RAFAEL2" e "PIRAMIDE"
        Então deve ser autenticado com sucesso
        E vai ter um seletor css com o texto "RAFAEL"
