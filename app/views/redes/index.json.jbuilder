json.array!(@redes) do |rede|
  json.extract! rede, :id, :desc, :redetipo_id, :usuario_id, :parent_id
  json.url rede_url(rede, format: :json)
end
