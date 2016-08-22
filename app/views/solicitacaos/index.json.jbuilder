json.array!(@solicitacaos) do |solicitacao|
  json.extract! solicitacao, :id, :titulo, :descricao, :situacaodemanda_id, :dataprevisao, :anexo, :resolucao
  json.url solicitacao_url(solicitacao, format: :json)
end
