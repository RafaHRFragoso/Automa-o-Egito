#language:pt
@manterCA @all
Funcionalidade: Manter Contas Auxiliares

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    @incluirCA @back_homepage @tela_CA 
    Cenario: Cadastrar Contas Auxiliares Caminho Feliz
    Dado que o usuário acesse a tela de Incluir Contas Auxiliares
    Quando o usuário preencher os campos obrigatórios de Contas Auxiliares
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso

    @detalharCA
    Cenario: Detalhar Conta Auxiliar Caminho Feliz   
    Dado que o usuário pesquise uma Conta Auxiliar previamente incluida
    Quando detalhar o registro escolhido
    Então o sistema deverá exibir a tela de detalhamnento da Conta Auxiliar    

    @alterarCA
    Cenario: Alterar Conta Auxiliar Caminho Feliz
    Dado que o usuário pesquise uma Conta Auxiliar previamente incluida
    E acessar a tela de alteração de Conta Auxiliar
    Quando realizar a alteração da Conta Auxiliar
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso       

    @excluirCA
    Cenario: Excluir Conta Auxiliar Caminho Feliz
    Dado que o usuário pesquise uma Conta Auxiliar previamente incluida
    Quando realizar a exclusão do registro
    Então a operação deverá ser realizada com sucesso 