require 'fileutils'

class AdBarsController < ApplicationController
  before_action :set_ad_bar, only: [:show, :edit, :update, :destroy]
  before_action :set_campaigns

  add_breadcrumb "Ad Bars", :ad_bars_path

  # GET /ad_bars
  # GET /ad_bars.json
  def index
    @ad_bars = AdBar.all.page(params[:page])
  end

  # GET /ad_bars/1
  # GET /ad_bars/1.json
  def show
  end

  # GET /ad_bars/new
  def new
    @ad_bar = AdBar.new
    @ad_bar.ads.build
  end

  # GET /ad_bars/1/edit
  def edit
  end

  # POST /ad_bars
  # POST /ad_bars.json
  def create
    @ad_bar = AdBar.new(ad_bar_params)

    respond_to do |format|
      if @ad_bar.save

        remove_dir

        format.html { redirect_to @ad_bar, notice: 'Ad bar was successfully created.' }
        format.json { render :show, status: :created, location: @ad_bar }
      else
        format.html { render :new }
        format.json { render json: @ad_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_bars/1
  # PATCH/PUT /ad_bars/1.json
  def update
    respond_to do |format|
      if @ad_bar.update(ad_bar_params)

        remove_dir

        format.html { redirect_to @ad_bar, notice: 'Ad bar was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad_bar }
      else
        format.html { render :edit }
        format.json { render json: @ad_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_bars/1
  # DELETE /ad_bars/1.json
  def destroy
    @ad_bar.destroy

    remove_dir

    respond_to do |format|
      format.html { redirect_to ad_bars_url, notice: 'Ad bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_bar
      @ad_bar = AdBar.find(params[:id])
      @ad_bar.ads.build
    end

    def set_campaigns
      @campaigns = Campaign.includes(:company)
                           .order("companies.name, campaigns.title")
                           .map { |campaign| ["#{campaign.company.try(:trading_name)}: #{campaign.title}", campaign.id] }
    end

    def remove_dir
      directory_name = Rails.root.join("public/COMP#{@ad_bar.campaign.company_id}")

      if File.exists?(directory_name)
        FileUtils.remove_dir(directory_name, true)
        Rails.logger.info "Dir #{directory_name} removido!"
      else
        Rails.logger.info "Dir #{directory_name} não existe!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_bar_params
      params.require(:ad_bar).permit(:position, :campaign_id, :css_width, :css_height, :images_limit, :css_background_color, :space_between_images, ads_attributes: [:id, :_destroy, :image, :url, :ad_bar_id, :sort_order])
    end
end
