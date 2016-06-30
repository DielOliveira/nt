json.array!(@doacaos) do |doacao|
  json.extract! doacao, :id, :ciclo_id, :flagconfirmada, :flagrejeitada
  json.url doacao_url(doacao, format: :json)
end
