require 'erb'
require 'tilt'
require 'uri'

module API  
  module V1
    class Ads < Grape::API
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

      resource :ads do
        
        desc "Return all ads"
        get "", root: :adds do
          content_type 'text/plain'
          @ads = Ad.all
          puts params[:campaing_id]
          @ads = @ads.joins(:ad_bar).where(ad_bars: {position: params[:position]}) unless params[:position].blank?
          @ads = @ads.joins(:campaign).where(campaigns: {id: params[:campaing_id]}) unless params[:campaing_id].blank?
          @ads = @ads.joins(:company).where(companies: {id: params[:company_id]}) unless params[:company_id].blank?
          @ads
          template = Tilt.new(Rails.root.join('app/views/api/ads/list.html.erb'))
          template.render(ads: @ads)
        end
      end

    end
  end
end  