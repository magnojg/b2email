class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :set_companies

  add_breadcrumb "Campaign", :campaigns_path

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all.page params[:page]
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new

    3.times do
      @campaign.login_bg_images.build
    end
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save

        remove_dir

        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)

        remove_dir

        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy

    remove_dir

    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])

      unless @campaign.nil?
        image_bg_size = @campaign.login_bg_images.size
        if image_bg_size < 3
          (image_bg_size - 3).times do
            @campaign.login_bg_images.build
          end
        end
      end
    end

    def set_companies
      @companies = Company.pluck(:trading_name, :id)
    end

    def remove_dir
      directory_name = Rails.root.join("public/COMP#{@campaign.company_id}")

      if File.exists?(directory_name)
        FileUtils.remove_dir(directory_name, true)
        Rails.logger.info "Dir #{directory_name} removed!"
      else
        Rails.logger.info "Dir #{directory_name} doesn't"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:title, :start_at, :end_at, :company_id, login_bg_images_attributes: [:id, :_destroy, :image, :campaign_id, :sort_order])
    end
end
