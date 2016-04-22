json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :title, :start_at, :end_at, :company_id
  json.url campaign_url(campaign, format: :json)
end
