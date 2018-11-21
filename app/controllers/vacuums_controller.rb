class VacuumsController < ApplicationController
  before_action :set_vacuum, only: [:show, :destroy, :edit]

  def index
    if current_user
      @vacuums = Vacuum.all - current_user.owned_vacuums
    else
      @vacuums = Vacuum.all
    end

    @query = params.dig(:search, :query)

    if @query.present?
      sql_query = " \
        vacuums.model @@  :query \
        OR vacuums.address @@  :query \
        OR users.first_name @@  :query \
        OR users.last_name @@  :query \
        OR users.email @@  :query \
      "
      @vacuums = Vacuum.joins(:user).where(sql_query, query: "%#{@query}%")
    else
      @vacuums = Vacuum.all
    end

    # query is either an empty string or nil
    # if @query.present?
    #   @vacuums = Vacuum.where("model ILIKE ? OR address ILIKE ?", "%#{@query}%", "%#{@query}%")
    # else
    #   @vacuums = Vacuum.all
    # end
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
