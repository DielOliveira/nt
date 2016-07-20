json.array!(@indicados) do |indicado|
  json.extract! indicado, :id
  json.url indicado_url(indicado, format: :json)
end
