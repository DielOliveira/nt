json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :email, :senha, :cadastro_id, :datainclusao, :dataultimologin, :flagativo
  json.url usuario_url(usuario, format: :json)
end
