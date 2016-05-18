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
        optional :ad_bar_id, type: Integer
        optional :campaign_id, type: Integer
        optional :position, type: String
      end
      resource :ad_bars do

        desc "Return all ads"
        get "", root: :ad_bars do
          content_type 'text/plain'

          error_msg = nil
          campaign = nil

          if not params[:ad_bar_id].blank?
            ad_bar = AdBar.find(params[:ad_bar_id])
            campaign = ad_bar.try(:campaign)
          elsif not (params[:campaign_id].blank? && params[:position].blank?)
            ad_bar = AdBar.where(campaign_id: params[:campaign_id], position: params[:position])
            unless ad_bar.nil?
              ad_bar = ad_bar.last
              campaign = ad_bar.try(:campaign)
            end
          else
            error_msg = '[ad_bar_id] or [campaign_id and position] is missing'
          end

          unless error_msg.nil?
            error!({ 'error_msg' => error_msg }, 401)
          end

          if campaign

            directory_name = "public/COMP#{campaign.company_id}"

            position = (ad_bar.nil?) ? params[:position] : ad_bar.position

            file_path = Rails.root.join("#{directory_name}/CAMP#{campaign.id}_POS#{position}.html")

            if File.exist?(file_path)
              file = File.read(file_path)
              return file.html_safe
            else
              Rails.logger.info "Creating #{file_path}"

              @ad_bars = AdBar.search(params)

              if not @ad_bars.nil?
                unless File.exists?(directory_name)
                  Dir.mkdir(directory_name)
                  Rails.logger.info "Dir #{directory_name} created!"
                else
                  Rails.logger.info "Dir #{directory_name} already exists"
                end

                template = Tilt::ERBTemplate.new(Rails.root.join('app/views/api/ads/list.html.erb'))

                File.open file_path, "w" do |file|
                  file.write template.render(ad_bars: @ad_bars)
                  Rails.logger.info "#{file_path} created!"
                  true
                end
              else
                Rails.logger.info "ad_bars nil"
                false
              end
            end
          end
        end
      end

    end
  end
end
