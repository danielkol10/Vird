class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @vacuum = Vacuum.find(params[:vacuum_id])
    @booking = Booking.new
  end

  def create
    @vacuum = Vacuum.find(params[:vacuum_id])
    @booking = Booking.new(booking_params)
    @booking.vacuum = @vacuum
    @booking.user = current_user
    if @booking.save
      redirect_to vacuum_booking_path(@vacuum, @booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to vacuum_path(@booking.vacuum)
  end

  def booking_params
    params.require(:booking).permit(:rent_duration)
  end
end
