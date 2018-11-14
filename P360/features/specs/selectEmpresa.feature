#language:pt
@selectEmpresa
Funcionalidade: Selecionar Empresa na HomePage
Para que eu possa acessar os módulos do P360
Sendo um usuário logado
Anteriormente devo selecionar a empresa desejada

    Contexto: Testes Contexto
        Dado que o usuário acesse a página inicial
        #Quando logar com "RAFAEL2" e "PIRAMIDE"
        Quando o usuário realizar o login
        Então deve ser autenticado com sucesso

    @empresa
    Cenario: Selecionar Empresa na HomePage
        
        Quando selecionar a empresa "ICOM COMÉRCIO - SP" 
        #Quando clicar no dropdown de seleção de empresa
        #E selecionar a empresa "ICOM COMÉRCIO - SP" 
        #Então devo aceitar o alerta de confirmação

 