class PlaceTypesController < ApplicationController
  before_action :set_place_type, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :destroy]

  before_filter :authorize_user, only: [:show, :new, :edit, :destroy]
  def authorize_user
    unless current_user.right == "administrator" 
      redirect_to root_path, :notice => 'You are not authorized'
    end
  end

  # GET /place_types
  # GET /place_types.json
  def index
    @place_types = PlaceType.all
  end

  # GET /place_types/1
  # GET /place_types/1.json
  def show
  end

  # GET /place_types/new
  def new
    @place_type = PlaceType.new
  end

  # GET /place_types/1/edit
  def edit
  end

  # POST /place_types
  # POST /place_types.json
  def create
    @place_type = PlaceType.new(place_type_params)

    respond_to do |format|
      if @place_type.save
        format.html { redirect_to manage_content_path, notice: 'Place type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @place_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @place_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /place_types/1
  # PATCH/PUT /place_types/1.json
  def update
    respond_to do |format|
      if @place_type.update(place_type_params)
        format.html { redirect_to manage_content_path, notice: 'Place type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @place_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /place_types/1
  # DELETE /place_types/1.json
  def destroy
    @place_type.destroy
    respond_to do |format|
      format.html { redirect_to manage_content_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place_type
      @place_type = PlaceType.find_by_slug!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_type_params
      params.require(:place_type).permit(:title, :slug, :category)
    end
end
