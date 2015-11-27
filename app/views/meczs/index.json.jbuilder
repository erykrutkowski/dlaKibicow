json.array!(@meczs) do |mecz|
  json.extract! mecz, :id, :gospodarz, :gosc, :punkty_gospodarzy, :punkty_gosci, :druzyna_id
  json.url mecz_url(mecz, format: :json)
end
