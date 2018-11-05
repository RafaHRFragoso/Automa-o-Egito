class CadCentroCusto < SitePrism::Page

    element :codigoField, '#codigo'
    element :descricaoField, '#descricao'
    element :hierarquiaField, '#hierarquia'

    $codigo = Faker::Number.number(5)
    $descricao = Faker::StarWars.character
    #$hierarquia = Faker::Number.number(7)

    def preencher_Campos
        @codigo = $codigo
        @descricao = $descricao
        #@hierarquia = $hierarquia
        codigoField.set(@codigo)
        descricaoField.set(@descricao)
        hierarquiaField.set(@codigo)

        page.find(:label, "Ativo").click
        page.find(:label, "Analitico").click        
    end  

end  

=begin
fill_in 'codigo', with: (Faker::Number.number(7))
fill_in 'descricao', with: (Faker::StarWars.character)
fill_in 'hierarquia', with: (Faker::Number.number(7))

page.find(:label, "Inativo").click
page.find(:label, "Ativo").click
page.find(:label, "Analitico").click
page.find(:label, "Sintético").click

=end