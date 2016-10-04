json.array!(@obrigacaos) do |obrigacao|
  json.extract! obrigacao, :id, :cadastro_id, :flagrealizado
  json.url obrigacao_url(obrigacao, format: :json)
end
