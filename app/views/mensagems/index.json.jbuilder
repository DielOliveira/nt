json.array!(@mensagems) do |mensagem|
  json.extract! mensagem, :id, :datarecebimento, :mensagem
  json.url mensagem_url(mensagem, format: :json)
end
