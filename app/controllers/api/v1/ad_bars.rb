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

      params do
        requires :campaign_id, type: Integer
        requires :position, type: String
      end
      resource :ad_bars do

        desc "Return all ads"
        get "", root: :ad_bars do
          content_type 'text/plain'

          campaign = Campaign.find(params[:campaign_id])

          if campaign

            directory_name = "public/#{campaign.company_id}"
            Dir.mkdir(directory_name) unless File.exists?(directory_name)

            file_path = Rails.root.join("#{directory_name}/#{params[:campaign_id]}_#{params[:position]}.html")

            unless File.exist?(file_path)
              @ad_bars = AdBar.includes(:ads)
              @ad_bars = @ad_bars.where(position: params[:position]) unless params[:position].blank?
              @ad_bars = @ad_bars.where(campaign_id: params[:campaing_id]) unless params[:campaing_id].blank?
              # @ad_bars = @ad_bars.joins(:company).where(companies: params[:company_id]) unless params[:company_id].blank?
              template = Tilt::ERBTemplate.new(Rails.root.join('app/views/api/ads/list.html.erb'))

              File.open file_path, "w" do |file|
                  file.write template.render(ad_bars: @ad_bars)
              end
            end
          end
        end
      end

    end
  end
end
