#language:pt
@manterCCusto @all
Funcionalidade: Manter Centro de Custo

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    @incluirCCusto @back_homepage @tela_CCusto
    Cenario: Cadastrar Centro de Custo Analítico
    Dado que o usuário acesse a tela de Incluir Centro de Custo
    Quando o usuário preencher os campos obrigatórios do Centro de Custo
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso

    @detalharCCusto
    Cenario: Detalhar Centro de Custo   
    Dado que o usuário pesquise um Centro de Custo previamente incluido
    Quando detalhar o registro escolhido
    Então o sistema deverá exibir a tela de detalhamnento do Centro de Custo 

    @alterarCCusto
    Cenario: Alterar Centro de Custo
    Dado que o usuário pesquise um Centro de Custo previamente incluido
    E acessar a tela de alteração de Centro de Custo 
    Quando realizar a alteração do Centro de Custo 
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso       

    @excluirCCusto
    Cenario: Excluir Centro de Custo
    Dado que o usuário pesquise um Centro de Custo previamente incluido
    Quando realizar a exclusão do registro
    Então a operação deverá ser realizada com sucesso 

    @contasCCusto @back_homepage @tela_CCusto @voltar
    Cenario: Associar Conta a Centro de Custo   
    Dado que o usuário pesquise um Centro de Custo para ser associado
    E acessar a tela de Associação de Contas ao Centro de Custo
    Quando realizar a associação da Conta com o Centro de Custo
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso    

    @contasCCusto
    Cenario: Desassociar Conta a Centro de Custo  
    Dado que o usuário pesquise um Centro de Custo para ser desassociado
    E acessar a tela de Associação de Contas ao Centro de Custo
    Quando realizar a desassociação da Conta com o Centro de Custo
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso    

    @gruposCCusto @back_homepage @tela_CCusto @voltar
    Cenario: Associar Centro de Custo a Grupos de Centros de Custo
    Dado que o usuário pesquise um Centro de Custo para ser associado
    E acessar a tela de Associação de Centro de Custo a Grupos de Centros de Custo
    Quando realizar a associação do Centro de Custo com o Grupos de Centros de Custo
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso    

    @gruposCCusto
    Cenario: Desassociar Centro de Custo a Grupos de Centros de Custo
    Dado que o usuário pesquise um Centro de Custo para ser desassociado
    E acessar a tela de Associação de Centro de Custo a Grupos de Centros de Custo
    Quando realizar a desassociação do Centro de Custo com o Grupos de Centros de Custo
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso    