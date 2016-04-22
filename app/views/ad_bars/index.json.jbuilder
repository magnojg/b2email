json.array!(@ad_bars) do |ad_bar|
  json.extract! ad_bar, :id, :position, :campaign_id
  json.url ad_bar_url(ad_bar, format: :json)
end
