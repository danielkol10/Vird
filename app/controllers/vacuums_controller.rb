class VacuumsController < ApplicationController
  before_action :set_vacuum, only: [:show, :destroy, :edit]

  def index
    @vacuums = Vacuum.where.not(latitude: nil, longitude: nil)

    @markers = @vacuums.map do |vacuum|
      {
        lng: vacuum.longitude,
        lat: vacuum.latitude,
        infoWindow: { content: render_to_string(partial: "vacuums/vacuum_window", locals: { vacuum: vacuum }) }
      }
    end

    if current_user
      @vacuums = Vacuum.all - current_user.owned_vacuums
    else
      @vacuums = Vacuum.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @vacuum = Vacuum.new
  end

  def create
    @vacuum = Vacuum.new(vacuum_params)
    @vacuum.user = current_user

    if @vacuum.save
      redirect_to @vacuum
    else
      render :new
    end
  end

  def edit
  end

  def update
    @vacuum = Vacuum.find(params[:id])
    @vacuum.update(vacuum_params)
    redirect_to root_path
  end

  def destroy
    @vacuum.destroy
    redirect_to vacuums_path
  end

  private

  def vacuum_params
    params.require(:vacuum).permit(:model, :price, :address, :available)
  end

  def set_vacuum
    @vacuum = Vacuum.find(params[:id])
  end
end
