class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  # GET /boats
  # GET /boats.json
  def index
    @boats = current_user.boats
    puts " ** ENV['S3_REGION']: #{ENV['S3_REGION'].inspect}"
    puts " ** ENV['S3_BUCKET']: #{ENV['S3_BUCKET'].inspect}"
    puts " ** ENV['AWS_ACCESS_KEY_ID']: #{ENV['AWS_ACCESS_KEY_ID'].inspect}"
    puts " ** ENV['AWS_SECRET_ACCESS_KEY']: #{ENV['AWS_SECRET_ACCESS_KEY'].inspect}"
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
  end

  # GET /boats/new
  def new
    @boat = Boat.new
  end

  # GET /boats/1/edit
  def edit
  end

  # POST /boats
  # POST /boats.json
  def create
    @boat = Boat.new(boat_params)
    @boat.user_id = current_user.id

    respond_to do |format|
      if @boat.save
        format.html { redirect_to @boat, notice: 'Boat was successfully created.' }
        # format.json { render :show, status: :created, location: @boat }
        format.js
      else
        format.html { render :new }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to @boat, notice: 'Boat was successfully updated.' }
        format.json { render :show, status: :ok, location: @boat }
      else
        format.html { render :edit }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @boat.destroy
    respond_to do |format|
      format.html { redirect_to boats_url, notice: 'Boat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat
      @boat = Boat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boat_params
      params.require(:boat).permit(:name, :containers, :location)
    end
end
