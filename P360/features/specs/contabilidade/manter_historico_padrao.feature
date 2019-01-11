#language:pt
@manterHP
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

    @detalharHP @tela_HP_fast
    Cenario: Detalhar Historico Padrão Caminho Feliz   
    Dado que o usuário pesquise um Historico Padrão 'incluido'
    Quando detalhar o registro escolhido do historico Padrão
    Então o sistema deverá exibir a tela de detalhamento de Historico Padrão

    @alterarHP @tela_HP_fast
    Cenario: Alterar Historico Padrão Caminho Feliz
    Dado que o usuário pesquise um Historico Padrão 'incluido'
    Quando acessar a tela de alteração de Historico Padrão
    E realizar a alteração do Historico Padrão
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso       

    @excluirHP @tela_HP_fast
    Cenario: Excluir Historico Padrão Caminho Feliz
    Dado que o usuário pesquise um Historico Padrão 'alterado'
    Quando realizar a exclusão do Historico Padrão
    Então a operação deverá ser realizada com sucesso 