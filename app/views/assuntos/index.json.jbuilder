json.array!(@assuntos) do |assunto|
  json.extract! assunto, :id, :assunto
  json.url assunto_url(assunto, format: :json)
end
