class Admin::CampaignsController < ApplicationController
  before_action :set_admin_campaign, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_companies

  # GET /admin/campaigns
  # GET /admin/campaigns.json
  def index
    @admin_campaigns = Admin::Campaign.all
  end

  # GET /admin/campaigns/1
  # GET /admin/campaigns/1.json
  def show
  end

  # GET /admin/campaigns/new
  def new
    @admin_campaign = Admin::Campaign.new
  end

  # GET /admin/campaigns/1/edit
  def edit
  end

  # POST /admin/campaigns
  # POST /admin/campaigns.json
  def create
    @admin_campaign = Admin::Campaign.new(admin_campaign_params)

    respond_to do |format|
      if @admin_campaign.save
        format.html { redirect_to @admin_campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @admin_campaign }
      else
        format.html { render :new }
        format.json { render json: @admin_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/campaigns/1
  # PATCH/PUT /admin/campaigns/1.json
  def update
    respond_to do |format|
      if @admin_campaign.update(admin_campaign_params)
        format.html { redirect_to @admin_campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_campaign }
      else
        format.html { render :edit }
        format.json { render json: @admin_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/campaigns/1
  # DELETE /admin/campaigns/1.json
  def destroy
    @admin_campaign.destroy
    respond_to do |format|
      format.html { redirect_to admin_campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_campaign
      @admin_campaign = Admin::Campaign.find(params[:id])
    end

    def set_admin_companies
      @admin_companies = Admin::Company.pluck(:trading_name, :id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_campaign_params
      params.require(:admin_campaign).permit(:title, :start_at, :end_at, :admin_company_id)
    end
end
