json.array!(@bancos) do |banco|
  json.extract! banco, :id, :nomebanco
  json.url banco_url(banco, format: :json)
end
