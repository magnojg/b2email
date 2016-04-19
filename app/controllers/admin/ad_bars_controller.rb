class Admin::AdBarsController < ApplicationController
  before_action :set_admin_ad_bar, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_campaigns

  # GET /admin/ad_bars
  # GET /admin/ad_bars.json
  def index
    @admin_ad_bars = Admin::AdBar.all
  end

  # GET /admin/ad_bars/1
  # GET /admin/ad_bars/1.json
  def show
  end

  # GET /admin/ad_bars/new
  def new
    @admin_ad_bar = Admin::AdBar.new
  end

  # GET /admin/ad_bars/1/edit
  def edit
  end

  # POST /admin/ad_bars
  # POST /admin/ad_bars.json
  def create
    @admin_ad_bar = Admin::AdBar.new(admin_ad_bar_params)

    respond_to do |format|
      if @admin_ad_bar.save
        format.html { redirect_to @admin_ad_bar, notice: 'Ad bar was successfully created.' }
        format.json { render :show, status: :created, location: @admin_ad_bar }
      else
        format.html { render :new }
        format.json { render json: @admin_ad_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/ad_bars/1
  # PATCH/PUT /admin/ad_bars/1.json
  def update
    respond_to do |format|
      if @admin_ad_bar.update(admin_ad_bar_params)
        format.html { redirect_to @admin_ad_bar, notice: 'Ad bar was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_ad_bar }
      else
        format.html { render :edit }
        format.json { render json: @admin_ad_bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/ad_bars/1
  # DELETE /admin/ad_bars/1.json
  def destroy
    @admin_ad_bar.destroy
    respond_to do |format|
      format.html { redirect_to admin_ad_bars_url, notice: 'Ad bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_ad_bar
      @admin_ad_bar = Admin::AdBar.find(params[:id])
    end

    def set_admin_campaigns
      @admin_campaigns = Admin::Campaign.pluck(:title, :id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_ad_bar_params
      params.require(:admin_ad_bar).permit(:position, :admin_campaign_id)
    end
end
