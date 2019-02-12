#language:pt
@manterGCC @all
Funcionalidade: Manter Grupo de Centro de Custo

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    @incluirGCC @back_homepage @tela_GCC @AIE
    Cenario: Cadastrar Grupo de Centro de Custo Caminho Feliz
        Dado que eu acesse a tela de Incluir Grupo de Centro de Custo
        Quando o usuário preencher os campos obrigatórios de Grupo de Centro de Custo
        E Salvar o registro
        Então a operação deverá ser realizada com sucesso

    @detalharGCC
    Cenario: Detalhar Grupo de Centro de Custo Caminho Feliz    
        Dado que o usuário pesquise um grupo de centro de custo previamente incluido
        Quando detalhar o registro escolhido
        Então o sistema deverá exibir a tela de detalhamento do Grupo de Centro de Custo

    @alterarGCC
    Cenario: Alterar Grupo de Centro de Custo Caminho Feliz
        Dado que o usuário pesquise um grupo de centro de custo previamente incluido
        E acessar a tela de alteração de Grupo de Centro de Custo
        Quando realizar as alterações do Grupo de Centro de Custo
        E Salvar o registro
        Então a operação deverá ser realizada com sucesso     

    @excluirGCC @AIE
    Cenario: Excluir Grupo de Centro de Custo Caminho Feliz
        Dado que o usuário pesquise um grupo de centro de custo previamente incluido
        Quando realizar a exclusão do registro
        Então a operação deverá ser realizada com sucesso 