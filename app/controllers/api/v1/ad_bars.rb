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
        requires :ad_bar_id, type: Integer
      end
      resource :ad_bars do

        desc "Return all ads"
        get "", root: :ad_bars do
          content_type 'text/plain'

          error_msg = nil
          campaign = nil

          ad_bar = AdBar.find(params[:ad_bar_id])
          campaign = ad_bar.try(:campaign)

          if campaign

            directory_name = "public/COMP#{campaign.company_id}"

            position = ad_bar.position

            file_path = Rails.root.join("#{directory_name}/CAMP#{campaign.id}_POS#{position.humanize}.html")

            if File.exist?(file_path)
              file = File.read(file_path)
              {
                position: position,
                content: file.html_safe
              }
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
                end

                file = File.read(file_path)
                
                {
                  position: position,
                  content: file.html_safe
                }
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
