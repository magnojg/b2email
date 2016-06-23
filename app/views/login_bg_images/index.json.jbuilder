json.array!(@login_bg_images) do |login_bg_image|
  json.extract! login_bg_image, :id
  json.url login_bg_image_url(login_bg_image, format: :json)
end
