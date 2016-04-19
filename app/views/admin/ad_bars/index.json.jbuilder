json.array!(@admin_ad_bars) do |admin_ad_bar|
  json.extract! admin_ad_bar, :id, :position, :admin_campaign_id
  json.url admin_ad_bar_url(admin_ad_bar, format: :json)
end
