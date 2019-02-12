#language:pt
@manterGCA @all
Funcionalidade: Manter Grupo de Conta Auxiliar

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    @incluirGCA @back_homepage @tela_GCA
    Cenario: Cadastrar Grupo de Conta Auxiliar Caminho Feliz
        Dado que eu acesse a tela de Incluir Grupo de Conta Auxiliar
        Quando o usuário preencher os campos obrigatórios de Grupo de Conta Auxiliar
        E Salvar o registro
        Então a operação deverá ser realizada com sucesso

    @detalharGCA
    Cenario: Detalhar Grupo de Conta Auxiliar Caminho Feliz    
        Dado que o usuário pesquise um registro previamente incluido
        Quando detalhar o registro escolhido
        Então o sistema deverá exibir a tela de detalhamento do Grupo de Conta Auxiliar

    @alterarGCA
    Cenario: Alterar Grupo de Conta Auxiliar Caminho Feliz
        Dado que o usuário pesquise um registro previamente incluido
        E acessar a tela de alteração de Grupo de Conta Auxiliar
        Quando realizar as alteração do Grupo de Conta Auxiliar
        E Salvar o registro
        Então a operação deverá ser realizada com sucesso     

    @excluirGCA
    Cenario: Excluir Grupo de Conta Auxiliar Caminho Feliz
        Dado que o usuário pesquise um registro previamente incluido
        Quando realizar a exclusão do registro
        Então a operação deverá ser realizada com sucesso 