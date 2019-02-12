#language:pt
@manterCCCCA @all
Funcionalidade: Manter Contas por Centro de Custo e Conta Auxilar

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    @incluirCCCCA @back_homepage @tela_CCCCA
    Cenario: Cadastrar Conta por Centro de Custo e Conta Auxiliar
    Dado que o usuário acesse a tela de Incluir Conta por Centro de Custo e Conta Auxiliar
    Quando o usuário preencher os campos obrigatórios da Conta por Centro de Custo e Conta Auxiliar
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso

    @detalharCCCCA
    Cenario: Detalhar Conta por Centro de Custo e Conta Auxiliar
    Dado que o usuário pesquise uma Conta por Centro de Custo e Conta Auxiliar previamente incluida
    Quando detalhar o registro escolhido
    Então o sistema deverá exibir a tela de detalhamento de Conta por Centro de Custo e Conta Auxiliar

    @alterarCCCCA
    Cenario: Alterar Conta por Centro de Custo e Conta Auxiliar
    Dado que o usuário pesquise uma Conta por Centro de Custo e Conta Auxiliar previamente incluida
    E acessar a tela de alteração de Conta por Centro de Custo e Conta Auxiliar
    Quando realizar a alteração da Conta por Centro de Custo e Conta Auxiliar
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso       

    @excluirCCCCA
    Cenario: Excluir Conta por Centro de Custo e Conta Auxiliar  
    Dado que o usuário pesquise uma Conta por Centro de Custo e Conta Auxiliar previamente incluida
    Quando realizar a exclusão do registro
    Então a operação deverá ser realizada com sucesso 