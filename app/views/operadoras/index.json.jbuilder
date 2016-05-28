json.array!(@operadoras) do |operadora|
  json.extract! operadora, :id, :nomeoperadora
  json.url operadora_url(operadora, format: :json)
end
