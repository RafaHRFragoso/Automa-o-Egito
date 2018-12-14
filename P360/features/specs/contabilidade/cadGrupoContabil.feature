#language:pt
@cadgrupoContabil
Funcionalidade: Cadastrar Grupo Contábil

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    Contexto: Pré-condições
        Dado que o usuário acesse a página inicial
        Quando o usuário realizar o login
        Então deve ser autenticado com sucesso
        E selecionar a empresa "ICOM COMÉRCIO - SP" 
        Então acessar a tela de Grupo Contábil     
            
    Cenario: Cadastrar Grupo Contábil Caminho Feliz
