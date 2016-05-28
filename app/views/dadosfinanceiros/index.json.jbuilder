json.array!(@dadosfinanceiros) do |dadosfinanceiro|
  json.extract! dadosfinanceiro, :id, :nometitular, :cpftitular, :banco_id, :agencia, :codigo, :operacao, :contabancariatipo_id, :observacao, :emailsuperconta, :datainclulsao
  json.url dadosfinanceiro_url(dadosfinanceiro, format: :json)
end
