json.array!(@tipoconta) do |tipocontum|
  json.extract! tipocontum, :id, :nometipo
  json.url tipocontum_url(tipocontum, format: :json)
end
