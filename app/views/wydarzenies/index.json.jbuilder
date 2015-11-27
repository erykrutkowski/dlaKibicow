json.array!(@wydarzenies) do |wydarzeny|
  json.extract! wydarzeny, :id, :data_meczu, :zawodnik_nazwisko, :w_ktorej_minucie_gol, :czerwona_kartka, :zolta_kartka_string, :pilkarz_id, :mecz_id
  json.url wydarzeny_url(wydarzeny, format: :json)
end
