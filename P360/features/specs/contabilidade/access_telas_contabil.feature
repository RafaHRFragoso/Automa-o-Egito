#language:pt
@telas_contabilidade
Funcionalidade: Acessar Telas Módulo Contábil


    Contexto: Pré-condições
        Dado que o usuário acesse a página inicial
        Quando logar com "RAFAEL2" e "PIRAMIDE"
        Então deve ser autenticado com sucesso
        E selecionar a empresa "ICOM COMÉRCIO - SP" 

     ### CADASTRO -> PLANO DE CONTAS ### 

    @acessarTelaGC          
    Cenario: Acessar Tela Grupo Contábil
        Quando acessar a tela de Grupo Contábil        
        Então o sistema deve exibir a tela de Grupo Contábil
    
    @acessarTelaGCA
    Cenario: Acessar Tela Grupos de Contas Auxiliares
        Quando acessar a tela de Grupos de Contas Auxiliares        
        Então o sistema deve exibir a tela de Grupos de Contas Auxiliares 

    @acessarTelaCA
    Cenario: Acessar Tela Contas Auxiliares    
        Quando acessar a tela de Contas Auxiliares
        Então o sistema deve exibir a tela de Contas Auxiliares 

    @acessarTelaCCont
    Cenario: Acessar Tela Contas Contábeis  
        Quando acessar a tela de Contas Contábeis        
        Então o sistema deve exibir a tela de Contas Contábeis  

     ### CADASTRO -> CENTROS DE CUSTO ### 

    @acessarTelaCCust
    Cenario: Acessar Tela Centros de Custo
        Quando acessar a tela de Centros de Custo     
        Então o sistema deve exibir a tela de Centros de Custo     

    @acessarTelaGCC
    Cenario: Acessar Tela Grupos de Centro de Custo  
        Quando acessar a tela de Grupos de Centro de Custo    
        Então o sistema deve exibir a tela de Grupos de Centro de Custo

    @acessarTelaCCCCA
    Cenario: Acessar Tela Contas por Centro de Custo e Conta Auxilar
        Quando acessar a tela de Contas por Centro de Custo e Conta Auxilar    
        Então o sistema deve exibir a tela de Contas por Centro de Custo e Conta Auxilar


    ### CADASTROS ### 

    @acessarTelaHP
    Cenario: Acessar Tela Histórico Padrão
        Quando acessar a tela de Histórico Padrão    
        Então o sistema deve exibir a tela de Histórico Padrão

    @acessarTelaTL
    Cenario: Acessar Tela Tipo de Lançamento
        Quando acessar a tela de Tipo de Lançamento
        Então o sistema deve exibir a tela de Tipo de Lançamento

    ### LANÇAMENTOS ### 

    @acessarTelaLN        
    Cenario: Acessar Tela Lançamento Normal
        Quando acessar a tela de Lançamento Normal  
        Então o sistema deve exibir a tela de Lançamento Normal
    
    @acessarTelaLA
    Cenario: Acessar Tela Lançamento Automático
        Quando acessar a tela de Lançamento Automático  
        Então o sistema deve exibir a tela de Lançamento Automático

    @acessarTelaAL
    Cenario: Acessar Tela Autorização de Lançamentos
        Quando acessar a tela de Autorização de Lançamentos  
        Então o sistema deve exibir a tela de Autorização de Lançamentos

    @acessarTelaPTC
    Cenario: Acessar Tela Provisão de Títulos por Competência
        Quando acessar a tela de Provisão de Títulos por Competência  
        Então o sistema deve exibir a tela de Provisão de Títulos por Competência

    @acessarTelaRRC
    Cenario: Acessar Tela Reconhecimento de Receita por Competência
        Quando acessar a tela de Reconhecimento de Receita por Competência
        Então o sistema deve exibir a tela de Reconhecimento de Receita por Competência   

    ### RELATÓRIOS ### 

    @acessarTelaBC       
    Cenario: Acessar Tela Balancete
        Quando acessar a tela de Balancete
        Então o sistema deve exibir a tela de Balancete

    @acessarTelaLA
    Cenario: Acessar Tela Razão
        Quando acessar a tela de Razão 
        Então o sistema deve exibir a tela de Razão

    @acessarTelaAL
    Cenario: Acessar Tela Diário
        Quando acessar a tela de Diário
        Então o sistema deve exibir a tela de Diário