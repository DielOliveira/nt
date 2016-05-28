json.array!(@contabancariatipos) do |contabancariatipo|
  json.extract! contabancariatipo, :id, :nometipo
  json.url contabancariatipo_url(contabancariatipo, format: :json)
end
