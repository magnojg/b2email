class LoginBgImagesController < ApplicationController
  before_action :set_login_bg_image, only: [:show, :edit, :update, :destroy]

  # GET /login_bg_images
  # GET /login_bg_images.json
  def index
    @login_bg_images = LoginBgImage.all
  end

  # GET /login_bg_images/1
  # GET /login_bg_images/1.json
  def show
  end

  # GET /login_bg_images/new
  def new
    @login_bg_image = LoginBgImage.new
  end

  # GET /login_bg_images/1/edit
  def edit
  end

  # POST /login_bg_images
  # POST /login_bg_images.json
  def create
    @login_bg_image = LoginBgImage.new(login_bg_image_params)

    respond_to do |format|
      if @login_bg_image.save
        format.html { redirect_to @login_bg_image, notice: 'Login bg image was successfully created.' }
        format.json { render :show, status: :created, location: @login_bg_image }
      else
        format.html { render :new }
        format.json { render json: @login_bg_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /login_bg_images/1
  # PATCH/PUT /login_bg_images/1.json
  def update
    respond_to do |format|
      if @login_bg_image.update(login_bg_image_params)
        format.html { redirect_to @login_bg_image, notice: 'Login bg image was successfully updated.' }
        format.json { render :show, status: :ok, location: @login_bg_image }
      else
        format.html { render :edit }
        format.json { render json: @login_bg_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login_bg_images/1
  # DELETE /login_bg_images/1.json
  def destroy
    @login_bg_image.destroy
    respond_to do |format|
      format.html { redirect_to login_bg_images_url, notice: 'Login bg image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login_bg_image
      @login_bg_image = LoginBgImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_bg_image_params
      params.fetch(:login_bg_image, {})
    end
end
