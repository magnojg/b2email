require 'erb'
require 'tilt'
require 'uri'

module API
  module V1
    class B2email < Grape::API
      include API::V1::Defaults

      before do
          @vt = true
          params[:tk] = URI.decode(params[:tk]) unless params[:tk].blank?

          generated_token = "B2EMAIL"

          unless params[:tk] == generated_token
            @vt = false
            error!({ messages: "Invalid token" }, 400)
          end

          params
      end

      params do
        requires :company_id, type: Integer
      end
      resource :login_images do
        get "", :root => :login_images do
          content_type 'text/plain'

          company_id = params[:company_id]

          campaign = Campaign.where(company_id: company_id).order(:created_at => :desc).last
          if campaign
            content = {
              campaign.login_bg_images.each do |lbi|
                
              end
            }

          end

        end
      end

      params do
        requires :company_id, type: Integer
        requires :position, type: String
        optional :renew_file, type: Boolean
      end
      resource :ad_bar do

        desc "Return all ads"
        get "", :root => :ad_bars do
          content_type 'text/plain'

          company_id = params[:company_id]
          position = params[:position]

          renew_file = params[:renew_file]
          renew_file ||= false

          error_msg = nil
          campaign = Campaign.where(company_id: company_id).order(:created_at => :desc).last

          if campaign
            ad_bar = campaign.ad_bars.where(position: position).order(:created_at => :desc).last

            directory_name = "public/COMP#{company_id}"
            position = ad_bar.position
            file_path = Rails.root.join("#{directory_name}/CAMP#{campaign.id}_POS#{position.humanize}.html")

            # Caso exista cache, apenas mostra
            if File.exist?(file_path) and (not renew_file)

              file = File.read(file_path)
              {
                position: position,
                content: file.html_safe,
                is_cache: true
              }
            else

              Rails.logger.info "Creating #{file_path}"

              # params[:campaign_id] = campaign.id

              # @ad_bars = AdBar.search(params)

              # if not @ad_bars.nil?

              # Caso o diretório não exista, crie
              unless File.exists?(directory_name)

                Dir.mkdir(directory_name)
                Rails.logger.info "Dir #{directory_name} created!"
              else

                Rails.logger.info "Dir #{directory_name} already exists"
              end

              template = Tilt::ERBTemplate.new(Rails.root.join('app/views/api/ads/list.html.erb'))

              File.open file_path, "w" do |file|
                file.write template.render(ad_bars: ad_bar)
                Rails.logger.info "#{file_path} created!"
              end

              file = File.read(file_path)

              {
                position: position,
                content: file.html_safe,
                is_cache: false
              }
            end
          end
        end
      end

    end
  end
end
