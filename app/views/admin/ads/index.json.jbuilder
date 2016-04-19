json.array!(@admin_ads) do |admin_ad|
  json.extract! admin_ad, :id, :image, :title, :subtitle, :url, :admin_ad_bar_id
  json.url admin_ad_url(admin_ad, format: :json)
end
