Funcionalidade: Cadastrar
Para que eu possa acessar os módulos do P360
Sendo um usuário logado
Anteriormente devo selecionar a empresa desejada

    Contexto: Testes Contexto
        Dado que eu acesso a página inicial
        #Então a logo do sistema deve ser exibida
        Quando eu faço login com "RAFAEL2" e "PIRAMIDE"
        Então deve ser autenticado com sucesso
        #E vai ter um seletor css com o texto "RAFAEL"