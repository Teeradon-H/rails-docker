class MasksController < ApplicationController
  before_action :set_mask, only: %i[ show edit update destroy ]

  def login 
  
  end
  # GET /masks or /masks.json
  def index
    # session[:role] = 'officer'
    # session[:areaId] = 'area02'

    if(session[:role] == "admin")
      @masks = Mask.all
    end
    if(session[:role] == "officer")
      @masks = Mask.find_by(areaId: session[:areaId])
    end
  end

  # GET /masks/1 or /masks/1.json
  def show
  end

  # GET /masks/new
  def new
    @mask = Mask.new
  end

  # GET /masks/1/edit
  def edit
  end

  # POST /masks or /masks.json
  def create
    @mask = Mask.new(mask_params)

    respond_to do |format|
      if @mask.save
        format.html { redirect_to mask_url(@mask), notice: "Mask was successfully created." }
        format.json { render :show, status: :created, location: @mask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /masks/1 or /masks/1.json
  def update
    respond_to do |format|
      if @mask.update(mask_params)
        format.html { redirect_to mask_url(@mask), notice: "Mask was successfully updated." }
        format.json { render :show, status: :ok, location: @mask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /masks/1 or /masks/1.json
  def destroy
    @mask.destroy

    respond_to do |format|
      format.html { redirect_to masks_url, notice: "Mask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mask
      @mask = Mask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mask_params
      params.require(:mask).permit(:areaId, :amount)
    end
end
