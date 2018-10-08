#language:pt

Funcionalidade: Login
    Para que eu possa cadastrar e gerenciar minhas tarefas
    Sendo um Usuario
    Posso acessar o sistema ocm meu email e senha previamente cadastrados

    #Quando existe uma step que é uma pré-condição para todos os steps este step pode ser executado 
    #em forma de contexto que será executado antes de cada step
    Contexto: Página Inicial
        Dado que eu acesso a página inicial

    @logout
    Cenario: Usuario deve ser autorizado
        
        Quando eu faço login com "rfrag@email.com" e "senhapadrao"
        Então deve ser autenticado com sucesso
        E devo ver a seguinte mensagem "Olá, Rafael Fragoso"

    
    Esquema do Cenario: Tentativa de login
        Quando eu faço login com "<email>" e "<senha>"
        Então devo ver a seguinte mensagem "<alerta>"

        Exemplos:
            | email                   | senha       | alerta                      |
            | rfrag@email.com         | senhaerrada | Senha inválida.             |
            | usernotexists@email.com | senhapadrao | Usuário não cadastrado.     |
            | email@incorreto         | senhapadrao | Email incorreto ou ausente. |
            |                         | senhapadrao | Email incorreto ou ausente. |
            | rfrag@email.com         |             | Senha ausente.              |        

    # Cenario: Senha errada
        
    #     Quando eu faço login com "rfrag@email.com" e "senhaerrada"
    #     Então devo ver a seguinte mensagem "Senha inválida."

    # Cenario: Usuário não existe
        
    #     Quando eu faço login com "usernotexists@email.com" e "senhapadrao"
    #     Então devo ver a seguinte mensagem "Usuário não cadastrado."

    # Cenario: Email incorreto
        
    #     Quando eu faço login com "email@incorreto" e "senhapadrao"
    #     Então devo ver a seguinte mensagem "Email incorreto ou ausente."              
  