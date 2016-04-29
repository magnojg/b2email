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
    3.times do
      @ad_bar.ads.build
    end
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
    respond_to do |format|
      format.html { redirect_to ad_bars_url, notice: 'Ad bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_bar
      @ad_bar = AdBar.find(params[:id])

      unless @ad_bar.nil?
        ad_size = @ad_bar.ads.size
        if ad_size < 3
          (ad_size - 3).times do
            @ad_bar.ads.build
          end
        end
      end
    end

    def set_campaigns
      @campaigns = Campaign.pluck(:title, :id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_bar_params
      params.require(:ad_bar).permit(:position, :campaign_id, :css_style, :background_color, ads_attributes: [:id, :_destroy, :image, :title, :subtitle, :url, :ad_bar_id, :order])
    end
end
