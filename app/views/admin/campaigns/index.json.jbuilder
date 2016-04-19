json.array!(@admin_campaigns) do |admin_campaign|
  json.extract! admin_campaign, :id, :title, :start_at, :end_at, :admin_company_id
  json.url admin_campaign_url(admin_campaign, format: :json)
end
