json.array!(@druzynas) do |druzyna|
  json.extract! druzyna, :id, :nazwa, :miasto_pochodzenia, :nazwisko_trenera
  json.url druzyna_url(druzyna, format: :json)
end
