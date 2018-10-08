#language:pt
@cadgrupoContabil
Funcionalidade: Cadastrar Grupo Contábil


    Contexto: Pré-condições
        Dado que o usuário acesse a página inicial
        Quando logar com "RAFAEL2" e "PIRAMIDE"
        Então deve ser autenticado com sucesso
        E selecionar a empresa "ICOM COMÉRCIO - SP" 
        Então acessar a tela de Grupo Contábil     
            
    Cenario: Cadastrar Grupo Contábil Caminho Feliz
        Quando eu clico em pesquisar
