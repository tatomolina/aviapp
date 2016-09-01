class PlaneRegistrationsController < ApplicationController

  def index
    authorize PlaneRegistration
    @plane_registrations = PlaneRegistration.all
  end

  def new
    @plane_registration = PlaneRegistration.new
    authorize @plane_registration
  end

  def create
    @plane_registration = PlaneRegistration.new(plane_registration_params)
    authorize @plane_registration

    if @plane_registration.save
      flash[:notice] = "Registration succesfully created"
      redirect_to root_path
    else
      flash[:alert] = "#{@plane_registration.errors.count} errors prohibited this registration from being saved: "
      @plane_registration.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @plane_registration.errors.full_messages.last == msg
      end
      render 'new'
    end
  end

  def edit
    @plane_registration = PlaneRegistration.find(params[:id])
    authorize @plane_registration
  end

  def update
    @plane_registration = PlaneRegistration.find(params[:id])
    authorize @plane_registration

    if @plane_registration.update(plane_registration_params)
      flash[:notice] = "Registration succesfully updated"
      redirect_to root_path
    else
      #If i cant update, i render again the edit view
      flash[:alert] = "#{@plane_registration.errors.count} errors prohibited this registration from being saved: "
      @plane_registration.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @plane_registration.errors.full_messages.last == msg
      end
      render 'edit'
    end
  end


  private

  def plane_registration_params
    params.require(:plane_registration).permit(:plane_id, :prefix, :suffix, :odometer, :year, :power, :plane_class_id)
  end


end
