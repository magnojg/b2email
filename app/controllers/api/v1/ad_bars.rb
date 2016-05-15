require 'erb'
require 'tilt'
require 'uri'

module API  
  module V1
    class AdBars < Grape::API
      include API::V1::Defaults

      before do
          @vt = true
          params[:tk] = URI.decode(params[:tk]) unless params[:tk].blank?

          generated_token = "B2EMAIL"

          unless params[:tk] == generated_token
            @vt = false
            error!({messages: "Invalid token" }, 400)
          end
          params
      end

      resource :ad_bars do
        
        desc "Return all ads"
        get "", root: :ad_bars do
          content_type 'text/plain'
          @ad_bars = AdBar.includes(:ads)
          @ad_bars = @ad_bars.where(position: params[:position]) unless params[:position].blank?
          @ad_bars = @ad_bars.where(campaign_id: params[:campaing_id]) unless params[:campaing_id].blank?
          @ad_bars = @ad_bars.joins(:company).where(companies: {id: params[:company_id]}) unless params[:company_id].blank?
          template = Tilt.new(Rails.root.join('app/views/api/ads/list.html.erb'))
          template.render(ad_bars: @ad_bars)
        end
      end

    end
  end
end  