json.array!(@przebieg_meczus) do |przebieg_meczu|
  json.extract! przebieg_meczu, :id, :data_meczu, :miejsce_meczu, :druzyna, :w_ktorej_minucie_gol, :wynik_meczu, :rankingMeczy_id
  json.url przebieg_meczu_url(przebieg_meczu, format: :json)
end
