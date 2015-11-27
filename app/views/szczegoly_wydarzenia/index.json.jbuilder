json.array!(@szczegoly_wydarzenia) do |szczegoly_wydarzenium|
  json.extract! szczegoly_wydarzenium, :id, :data_wydarzenia, :ile_goli, :czerwone_kartki, :zolte_kartki, :pilkarz_id, :mecz_id
  json.url szczegoly_wydarzenium_url(szczegoly_wydarzenium, format: :json)
end
