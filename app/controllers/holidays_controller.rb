class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy]

  # GET /holidays
  # GET /holidays.json
  def index
    @holidays = Holiday.all
  end

  # GET /holidays/1
  # GET /holidays/1.json
  def show
  end

  # GET /holidays/new
  def new
    @holiday = Holiday.new
  end

  # GET /holidays/1/edit
  def edit
  end

  # POST /holidays
  # POST /holidays.json
  def create
    @holiday = current_user.holidays.new(holiday_params)
    if (@holiday.end_date - @holiday.start_date).to_i > 30
      flash[:notice] = "You Couldn't take More then One month leave"
      render :action => 'new'
    elsif (@holiday.end_date - @holiday.start_date).to_i == 0
          flash[:notice] = "Leave days Could'n be zero or less"
      render :action => 'new'
    elsif @holiday.start_date > @holiday.end_date
          flash[:notice] = "Please Select Valid date"
          render :action => 'new'
    else 
      @holiday.days = (@holiday.end_date - @holiday.start_date).to_i
      @holiday.save
        redirect_to holidays_path
    end
  end

  # PATCH/PUT /holidays/1
  # PATCH/PUT /holidays/1.json
  def update
    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to @holiday, notice: 'Holiday was successfully updated.' }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { render :edit }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday.destroy
    respond_to do |format|
      format.html { redirect_to holidays_url, notice: 'Holiday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def approve 
    @approve = Holiday.find(params[:format])
   if @approve.approve == false
        @approve.approve = true
         @approve.update_attributes(:approve => true)
  else 
        @approve.approve = false
        @approve.update_attributes(:approve => false)
  end
    redirect_to holidays_path
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holiday_params
      params.require(:holiday).permit(:start_date, :end_date, :days, :user_id)
    end
end
