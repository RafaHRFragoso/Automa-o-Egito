#language:pt
@manterTL
Funcionalidade: Manter Tipo de Lançamento

Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    @incluirTL @back_homepage @tela_TL
    Cenario: Cadastrar Tipo de Lançamento Caminho Feliz
    Dado que o usuário acesse a tela de Incluir Tipo de Lançamento
    Quando o usuário preencher os campos obrigatórios de Tipo de Lançamento
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso

    @detalharTL @tela_TL_fast
    Cenario: Detalhar Tipo de Lançamento Caminho Feliz   
    Dado que o usuário pesquise um Tipo de Lançamento previamente incluido
    Quando detalhar o registro escolhido
    Então o sistema deverá exibir a tela de detalhamnento do Tipo de Lançamento   

    @alterarTL @tela_TL_fast
    Cenario: Alterar Tipo de Lançamento Caminho Feliz
    Dado que o usuário pesquise um Tipo de Lançamento previamente incluido
    Quando acessar a tela de alteração de Tipo de Lançamento
    E realizar a alteração do Tipo de Lançamento
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso       

    @excluirTL @tela_TL_fast
    Cenario: Excluir Tipo de Lançamento Caminho Feliz
    Dado que o usuário pesquise um Tipo de Lançamento previamente incluido
    Quando realizar a exclusão do registro
    Então a operação deverá ser realizada com sucesso 
