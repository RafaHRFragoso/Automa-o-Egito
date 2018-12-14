#language:pt
@manterGCA
Funcionalidade: Manter Grupo de Conta Auxiliar

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    @incluirGCA @background_GCA
    Cenario: Cadastrar Grupo de Conta Auxiliar Caminho Feliz
        Dado que eu acesse a tela de Incluir Grupo de Conta Auxiliar
        Quando o usuário preencher os campos obrigatórios
        E Salvar o registro
        Então a operação deverá ser realizada com sucesso

    @detalharGCA @tela_GCA 
    Cenario: Detalhar Grupo de Conta Auxiliar Caminho Feliz    
        Quando o usuário pesquisar um registro previamente incluido
        E detalhar o registro escolhido
        Então o sistema deverá exibir a tela de detalhamnento  

    @alterarGCA @tela_GCA 
    Cenario: Alterar Grupo de Conta Auxiliar Caminho Feliz
        Quando o usuário pesquisar um registro previamente incluido
        E acessar a tela de alterar registro
        Então realizar as atlerações desejadas
        E Salvar o registro
        Então a operação deverá ser realizada com sucesso     

    @excluirGCA @tela_GCA 
    Cenario: Excluir Grupo de Conta Auxiliar Caminho Feliz
        Quando o usuário pesquisar um registro previamente incluido
        E realizar a exclusão do registro
        Então a operação deverá ser realizada com sucesso 