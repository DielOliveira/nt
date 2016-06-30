json.array!(@ciclos) do |ciclo|
  json.extract! ciclo, :id, :nomeciclo, :numerociclo, :valorciclo, :qtdreentradas
  json.url ciclo_url(ciclo, format: :json)
end
