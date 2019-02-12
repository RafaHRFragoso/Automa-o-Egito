#language:pt
@manterCC @all
Funcionalidade: Manter Contas Contábeis
Como um usuário logado no sistema
Posso acessar a tela desejada
E cadastrar um novo registro no sistema

    @incluirCCA @back_homepage @tela_CC
    Cenario: Cadastrar Conta Contábil Analítica Caminho Feliz
    Dado que o usuário acesse a tela de Incluir Contas Contábeis
    Quando o usuário preencher os campos obrigatórios de Contas Contábeis
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso

    @detalharCC
    Cenario: Detalhar Contas Contábeis Caminho Feliz   
    Dado que o usuário pesquise uma Conta Contábil previamente incluida
    Quando detalhar o registro escolhido
    Então o sistema deverá exibir a tela de detalhamnento da Conta Contábil    

    @alterarCC
    Cenario: Alterar Contas Contábeis Caminho Feliz
    Dado que o usuário pesquise uma Conta Contábil previamente incluida
    E acessar a tela de alteração de Conta Contábil
    Quando realizar a alteração da Conta Contábil
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso       

    @excluirCC
    Cenario: Excluir Contas Contábeis Caminho Feliz
    Dado que o usuário pesquise uma Conta Contábil previamente incluida
    Quando realizar a exclusão do registro
    Então a operação deverá ser realizada com sucesso 

    @associarCC @back_homepage @tela_CC @voltar
    Cenario: Associar Centro de Custo a Conta Contábil    
    Dado que o usuário pesquise uma Conta Contábil para ser associada
    E acessar a tela de Associação de Centros de Custo a Conta Contábil
    Quando realizar a associação do Centro de Custo com a Conta Contábil
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso    

    @desassociarCC
    Cenario: Desassociar Centro de Custo a Conta Contábil   
    Dado que o usuário pesquise uma Conta Contábil para ser associada
    E acessar a tela de Associação de Centros de Custo a Conta Contábil
    Quando realizar a desassociação do Centro de Custo com a Conta Contábil
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso   

    @copiarCC @back_homepage @tela_CC 
    Cenario: Copiar Conta Contábil Caminho Feliz
    Dado que o usuário pesquise uma Conta Contábil para ser copiada
    E acessar a tela de Copiar de Conta Contábil
    Quando realizar a copia da Conta Contábil
    E Salvar o registro
    Então a operação deverá ser realizada com sucesso
