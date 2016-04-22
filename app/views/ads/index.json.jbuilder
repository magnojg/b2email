json.array!(@ads) do |ad|
  json.extract! ad, :id, :image, :title, :subtitle, :url, :ad_bar_id
  json.url ad_url(ad, format: :json)
end
