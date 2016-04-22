class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.email) do |user|
        user.password = Rails.application.secrets.password
        user.password_confirmation = Rails.application.secrets.password
        user.confirm!
        user.admin!
      end
  end
end
