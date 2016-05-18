class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  def load_campaigns

		@campaigns = Campaign.where(company_id: params[:company_id]).pluck(:title, :id)
		@campaigns.insert(0, ["Select a Campaign", ""])
	end

  def load_ad_bars

    @ad_bars = AdBar.where(campaign_id: params[:campaign_id]).order(:position).map { |adbar| ["#{adbar.id} - #{adbar.position.humanize}", adbar.id] }
		@ad_bars.insert(0, ["Select an Ad Bar", ""])
	end
end
