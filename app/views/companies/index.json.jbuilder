json.array!(@companies) do |company|
  json.extract! company, :id, :name, :trading_name, :registration_number, :address
  json.url company_url(company, format: :json)
end
