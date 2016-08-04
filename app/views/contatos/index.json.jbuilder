json.array!(@contatos) do |contato|
  json.extract! contato, :id, :nome, :email, :assunto_id, :mensagem, :respondida
  json.url contato_url(contato, format: :json)
end
