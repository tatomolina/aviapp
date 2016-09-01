class PlanesController < ApplicationController

  def index
    authorize Plane
    @planes = Plane.all
  end

  def new
    @plane = Plane.new
    authorize @plane
  end

  def create
    @plane = Plane.new(plane_params)
    authorize @plane

    if @plane.save
      flash[:notice] = "Plane succesfully created"
      redirect_to root_path
    else
      flash[:alert] = "#{@plane.errors.count} errors prohibited this plane from being saved: "
      @plane.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @plane.errors.full_messages.last == msg
      end
      render 'new'
    end
  end

  def edit
    @plane = Plane.find(params[:id])
    authorize @plane
  end

  def update
    @plane = Plane.find(params[:id])
    authorize @plane

    if @plane.update(plane_params)
      flash[:notice] = "Plane succesfully updated"
      redirect_to root_path
    else
      #If i cant update, i render again the edit view
      flash[:alert] = "#{@plane.errors.count} errors prohibited this plane from being saved: "
      @plane.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @plane.errors.full_messages.last == msg
      end
      render 'edit'
    end
  end


  private

  def plane_params
    params.require(:plane).permit(:manufacturer, :model)
  end
end
