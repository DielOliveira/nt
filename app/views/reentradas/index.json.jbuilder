json.array!(@reentradas) do |reentrada|
  json.extract! reentrada, :id
  json.url reentrada_url(reentrada, format: :json)
end
