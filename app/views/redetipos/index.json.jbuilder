json.array!(@redetipos) do |redetipo|
  json.extract! redetipo, :id, :reentradaobrigatoria, :reentradas, :ordenada
  json.url redetipo_url(redetipo, format: :json)
end
