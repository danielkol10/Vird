class VacuumsController < ApplicationController
  before_action :set_vacuum, only: [:show, :destroy, :edit]
  def index
    @vacuums = Vacuum.all
  end

  def show
  end

  def new
    @vacuum = Vacuum.new
  end

  def create
    @vacuum = Vacuum.new (vacuum_params)
    @vacuum.save

    if @vacuum.save
      redirect_to @vacuum
    else
      render :new
    end
  end

end
