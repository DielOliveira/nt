json.array!(@situacaodemandas) do |situacaodemanda|
  json.extract! situacaodemanda, :id, :descricao
  json.url situacaodemanda_url(situacaodemanda, format: :json)
end
