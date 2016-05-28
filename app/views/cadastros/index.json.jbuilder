json.array!(@cadastros) do |cadastro|
  json.extract! cadastro, :id, :nomepessoa, :masculino, :email, :telefone, :operadora_id, :whatsapp, :skype, :facebook, :dadosfinanceiro_id, :dadatainclusao
  json.url cadastro_url(cadastro, format: :json)
end
