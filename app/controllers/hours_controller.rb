class HoursController < ApplicationController

  def index
    authorize Hour
    @hours = Hour.all
  end

  def show
    @hour = Hour.find(params[:id])
    authorize @hour
  end

  def new
    @hour = Hour.new
    authorize @hour
  end

  def create
    @hour = Hour.new(hour_params)
    @hour.user = current_user
    authorize @hour

    if @hour.save
      flash[:notice] = "Hour succesfully created"
      redirect_to root_path
    else
      flash[:alert] = "#{@hour.errors.count} errors prohibited this hour from being saved: "
      @hour.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @hour.errors.full_messages.last == msg
      end
      render 'new'
    end
  end

  def edit
    @hour = Hour.find(params[:id])
    authorize @hour
  end

  def update
    @hour = Hour.find(params[:id])
    authorize @hour

    if @hour.update(hour_params)
      flash[:notice] = "Hour succesfully updated"
      redirect_to root_path
    else
      #If i cant update, i render again the edit view
      flash[:alert] = "#{@hour.errors.count} errors prohibited this hour from being saved: "
      @hour.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @hour.errors.full_messages.last == msg
      end
      render 'edit'
    end
  end


  private

  def hour_params
    params.require(:hour).permit(:date, :start_time, :end_time, :purpose_flight_id, :plane_registration_id, :landings)
  end
end
