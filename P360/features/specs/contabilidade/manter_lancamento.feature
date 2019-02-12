#language:pt
@manterLC @all
Funcionalidade: Manter Lancamento

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo lancamento no sistema

    @lanc_cred_deb_dif_unico @back_homepage @tela_LC @voltar
    Cenario: Cadastrar Lancamento Com Debito e Credito Diferente
    Dado que o usuário acesse a tela de Incluir Lancamento
    Quando o usuario incluir um credito diferente de um debito
    E Salvar o registro
    Então o sistema deverá mostrar uma mensagem de erro

    @lanc_cred_deb_dif_multi @voltar
    Cenario: Cadastrar Lancamento Com mais de um Debito e Credito Diferentes
    Dado que o usuário acesse a tela de Incluir Lancamento
    Quando o usuario incluir mais de um credito e debito Diferentes
    E Salvar o registro
    Então o sistema deverá mostrar uma mensagem de erro

    @incluirLC 
    Cenario: Cadastrar Lancamento Com mais de um Debito e Credito Iguais
    Dado que o usuário acesse a tela de Incluir Lancamento
    Quando o usuario incluir mais de um credito e debito Iguais
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso

    @detalharLC
    Cenario: Detalhar Lancamento Caminho Feliz   
    Dado que o usuário pesquise um Lançamento previamente incluido
    Quando detalhar o registro escolhido
    Então o sistema deverá exibir o detalhamento do Lançamento   

    @alterarLC
    Cenario: Alterar Lancamento Caminho Feliz
    Dado que o usuário pesquise um Lançamento previamente incluido
    E acessar a tela de alteração do Lançamento
    Quando realizar a alteração do Lançamento
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso       

    @excluirLC
    Cenario: Excluir Lancamento Caminho Feliz
    Dado que o usuário pesquise um Lançamento previamente incluido
    Quando realizar a exclusão do registro
    Então a operação deverá ser realizada com sucesso 
