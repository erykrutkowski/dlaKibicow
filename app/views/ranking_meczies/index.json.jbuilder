json.array!(@ranking_meczies) do |ranking_meczy|
  json.extract! ranking_meczy, :id, :dataMeczu
  json.url ranking_meczy_url(ranking_meczy, format: :json)
end
