#language:pt
@cadCentroCusto
Funcionalidade: Cadastrar Centro de Custo

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    Contexto: Pré-condições
        Dado que o usuário acesse a página inicial
        #Quando logar com "RAFAEL2" e "PIRAMIDE"
        Quando o usuário realizar o login
        Então deve ser autenticado com sucesso
        E selecionar a empresa "ICOM COMÉRCIO - SP" 
        Quando acessar a tela de Centros de Custo        
        Então o sistema deve exibir a tela de Centros de Custo   

    @incluirCCust
    Cenario: Cadastrar Grupo de Conta Auxiliar Caminho Feliz
        Dado que eu acesse a tela de Incluir Centro de Custo
        Quando o usuário preencher os campos obrigatórios do Cadastro de Centro de Custo
        E Salvar o registro
        Então a operação deverá ser realizada com sucesso