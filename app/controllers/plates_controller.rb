class PlatesController < ApplicationController
  before_action :set_plate, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /plates or /plates.json
  def index
    @plates = Plate.all.order("created_at desc")
  end

  # GET /plates/1 or /plates/1.json
  def show
  end

  # GET /plates/new
  def new
    @plate = current_user.plates.build
  end

  # GET /plates/1/edit
  def edit
  end

  # POST /plates or /plates.json
  def create
    @plate = current_user.plates.build(plate_params)

    respond_to do |format|
      if @plate.save
        format.html { redirect_to plate_url(@plate), notice: "Plate was successfully created." }
        format.json { render :show, status: :created, location: @plate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plates/1 or /plates/1.json
  def update
    respond_to do |format|
      if @plate.update(plate_params)
        format.html { redirect_to plate_url(@plate), notice: "Plate was successfully updated." }
        format.json { render :show, status: :ok, location: @plate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plates/1 or /plates/1.json
  def destroy
    @plate.destroy

    respond_to do |format|
      format.html { redirect_to plates_url, notice: "Plate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate
      @plate = Plate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plate_params
      params.require(:plate).permit(:name, :image)
    end
end
