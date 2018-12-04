# PAGE TELA CENTRO DE CUSTO
class CadCentroCusto < SitePrism::Page
  element :codigoField, '#codigo'
  element :descricaoField, '#descricao'
  element :hierarquiaField, '#hierarquia'

  $codigo = Faker::Number.number(5)
  $descricao = Faker::StarWars.character
  # $hierarquia = Faker::Number.number(7)

  def preencher_Campos
    @codigo = $codigo
    @descricao = $descricao
    # @hierarquia = $hierarquia
    codigoField.set(@codigo)
    descricaoField.set(@descricao)
    hierarquiaField.set(@codigo)

    page.find(:label, 'Ativo').click
    page.find(:label, 'Analitico').click
  end
end
