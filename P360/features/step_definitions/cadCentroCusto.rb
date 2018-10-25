Dado("que eu acesse a tela de Incluir Centro de Custo") do
    botoes.clickButtonIncluir
    page.assert_text('Incluir Centro de Custo')
  end
  
  Quando("o usuário preencher os campos obrigatórios do Cadastro de Centro de Custo") do
    fill_in 'codigo', with: (Faker::Number.number(7))
    fill_in 'descricao', with: (Faker::StarWars.character)
    fill_in 'hierarquia', with: (Faker::Number.number(7))

    #ativo_Radio = page.find(:css, 'p-radiobutton > div > div > input[type="radio"][name="Indicador de Uso"][value="S"]', :visible => false)
    #inativo_Radio = page.find(:css, 'p-radiobutton > div > div > input[type="radio"][name="Indicador de Uso"][value="N"]', :visible => false)
    #sintetico_Radio = page.find(:css, 'p-radiobutton > div > div > input[type="radio"][name="Tipo"][value="S"]', :visible => false)
    #analitico_Radio = page.find(:css, 'p-radiobutton > div > div > input[type="radio"][name="Tipo"][value="A"]', :visible => false)
    page.find(:label, "Inativo").click
    sleep 1
    page.find(:label, "Ativo").click
    sleep 1
    page.find(:label, "Analitico").click
    sleep 1
    page.find(:label, "Sintético").click
    sleep 1
  end
  