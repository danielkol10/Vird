class VacuumsController < ApplicationController
  before_action :set_vacuum, only: [:show, :destroy, :edit]

  def index
    @vacuums = Vacuumm.all? { |e|  }
  end

  # def show

  # end

  # def new
  #   @vacuum = Vacuum.new
  # end

  # def create
  #   @vacuum = Vacuum.new(vacuum_params)
  #   @vacuum.save

  #   if @vacuum.save
  #     redirect_to @vacuum
  #   else
  #     render :new
  #   end
  # end

  # def edit
  # end

  # def update
  #   @vacuum = Vacuum.find(params[:id])
  #   @vacuum.update(vacuum_params)
  #   redirect_to vacuum_path
  # end

  # def destroy
  #   @vacuum.destroy
  #   redirect_to vacuums_path
  # end

  private

  def vacuum_params
    params.require(:vacuum).permit(:model, :price, :address)
  end

  def set_vacuum
    @vacuum = Vacuum.find(params[:id])
  end
end
