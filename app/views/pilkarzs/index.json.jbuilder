json.array!(@pilkarzs) do |pilkarz|
  json.extract! pilkarz, :id, :imie, :nazwisko, :ileGoli, :ile_zoltych_kartek, :ile_czerwonych, :druzyna_id
  json.url pilkarz_url(pilkarz, format: :json)
end
