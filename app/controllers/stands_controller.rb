class StandsController < ApplicationController
  before_action :set_stand, only: [:show, :edit, :update, :destroy]

  # GET /stands
  # GET /stands.json
  def index
    @stands = Stand.all
    @hash = Gmaps4rails.build_markers(@stands) do |stand, marker|
      stand_link = view_context.link_to stand.title, stand_path(stand)
      marker.lat stand.latitude
      marker.lng stand.longitude
      marker.infowindow "<p><img src='#{stand.photo.url(:thumb)}'></p>
                         <h5>#{stand_link}</h5>"
    end
  end

  # GET /stands/1
  # GET /stands/1.json
  def show
    set_stand
    @hash = Gmaps4rails.build_markers(@stand) do |stand, marker|
      marker.lat stand.latitude
      marker.lng stand.longitude
      marker.infowindow stand.description
    end
  end

  # GET /stands/new
  def new
    @stand = Stand.new
  end

  # GET /stands/1/edit
  def edit
  end

  # POST /stands
  # POST /stands.json
  def create
    @stand = Stand.new(stand_params)

    respond_to do |format|
      if @stand.save
        format.html { redirect_to @stand, notice: 'Stand was successfully created.' }
        format.json { render :show, status: :created, location: @stand }
      else
        format.html { render :new }
        format.json { render json: @stand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stands/1
  # PATCH/PUT /stands/1.json
  def update
    respond_to do |format|
      if @stand.update(stand_params)
        format.html { redirect_to @stand, notice: 'Stand was successfully updated.' }
        format.json { render :show, status: :ok, location: @stand }
      else
        format.html { render :edit }
        format.json { render json: @stand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stands/1
  # DELETE /stands/1.json
  def destroy
    @stand.destroy
    respond_to do |format|
      format.html { redirect_to stands_url, notice: 'Stand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stand
      @stand = Stand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stand_params
      params.require(:stand).permit(:latitude, :longitude, :address, :description, :title, :city, :photo)
    end
end
