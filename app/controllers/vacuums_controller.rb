class VacuumsController < ApplicationController

  def edit
  end

  def update
    @vacuum = Vacuum.find(params[:id])
    @vacuum.update(vacuum_params)
    redirect_to vacuum_path
  end
  def destroy
    @vacuum.destroy
    redirect_to vacuums_path
  end

  private

  def vacuum_params
    params.require(:vacuum).permit(:model, :price, :address)
  end

  def set_vacuum
    @vacuum = Vacuum.find(params[:id])
  end
end
