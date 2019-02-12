#language:pt
@manterHP @all
Funcionalidade: Manter Historico Padrão

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    @incluirHP @back_homepage @tela_HP
    Cenario: Cadastrar Historico Padrão Caminho Feliz
    Dado que o usuário acesse a tela de Incluir Historico Padrão
    Quando o usuário preencher os campos obrigatórios de Historico Padrão
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso

    @detalharHP
    Cenario: Detalhar Historico Padrão Caminho Feliz   
    Dado que o usuário pesquise um Historico Padrão previamente incluido
    Quando detalhar o registro escolhido
    Então o sistema deverá exibir o detalhamento do Historico Padrão pesquisado

    @alterarHP
    Cenario: Alterar Historico Padrão Caminho Feliz
    Dado que o usuário pesquise um Historico Padrão previamente incluido
    E acessar a tela de alteração de Historico Padrão
    Quando realizar a alteração do Historico Padrão
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso       

    @excluirHP
    Cenario: Excluir Historico Padrão Caminho Feliz
    Dado que o usuário pesquise um Historico Padrão previamente incluido
    Quando realizar a exclusão do registro
    Então a operação deverá ser realizada com sucesso 