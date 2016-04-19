json.array!(@admin_companies) do |admin_company|
  json.extract! admin_company, :id, :name, :trading_name, :registration_number, :address
  json.url admin_company_url(admin_company, format: :json)
end
