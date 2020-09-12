class HolidayTypesController < ApplicationController
  before_action :set_holiday_type, only: [:show, :edit, :update, :destroy]

  # GET /holiday_types
  # GET /holiday_types.json
  def index
    @holiday_types = HolidayType.order(:name).all
  end

  # GET /holiday_types/1
  # GET /holiday_types/1.json
  def show
  end

  # GET /holiday_types/new
  def new
    @holiday_type = HolidayType.new
  end

  # GET /holiday_types/1/edit
  def edit
  end

  # POST /holiday_types
  # POST /holiday_types.json
  def create
    @holiday_type = HolidayType.new(holiday_type_params)

    respond_to do |format|
      if @holiday_type.save
        format.html { redirect_to @holiday_type, notice: 'Holiday type was successfully created.' }
        format.json { render :show, status: :created, location: @holiday_type }
      else
        format.html { render :new }
        format.json { render json: @holiday_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holiday_types/1
  # PATCH/PUT /holiday_types/1.json
  def update
    respond_to do |format|
      if @holiday_type.update(holiday_type_params)
        format.html { redirect_to @holiday_type, notice: 'Holiday type was successfully updated.' }
        format.json { render :show, status: :ok, location: @holiday_type }
      else
        format.html { render :edit }
        format.json { render json: @holiday_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holiday_types/1
  # DELETE /holiday_types/1.json
  def destroy
    @holiday_type.destroy
    respond_to do |format|
      format.html { redirect_to holiday_types_url, notice: 'Holiday type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday_type
      @holiday_type = HolidayType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def holiday_type_params
      params.require(:holiday_type).permit(:name)
    end
end
