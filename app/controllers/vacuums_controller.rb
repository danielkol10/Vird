class VacuumsController < ApplicationController
  before_action :set_vacuum, only: [:show, :destroy, :edit]

  # ayout 'map', only: :index

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

    @query = params.dig(:search, :query)

    if @query.present? && current_user
      @vacuums = Vacuum.global_search(@query) - current_user.owned_vacuums
    elsif @query.present?
      @vacuums = Vacuum.global_search(@query)
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
      redirect_to my_virds_path
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
    @vacuum = Vacuum.find(params[:id])
    @vacuum.destroy
    redirect_to request.referer
  end

  private

  def vacuum_params
    params.require(:vacuum).permit(:model, :price, :address, :available)
  end

  def set_vacuum
    @vacuum = Vacuum.find(params[:id])
  end
end
