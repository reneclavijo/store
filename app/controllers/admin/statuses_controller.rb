class Admin::StatusesController < ApplicationController

  layout 'admin_layout'
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def show
  end

  def edit
  end

  def create
    @status = Status.new(params_status)
    if @status.save
      redirect_to admin_statuses_path
    else
      render :new
    end
  end

  def update
    if @status.update(params_status)
      redirect_to admin_statuses_path
    else
      render :edit
    end
  end

  def destroy
    @status.destroy
    redirect_to admin_statuses_path
  end
  private

  def params_status
    params.require(:status).permit(:description)
  end

  def set_status
    @status = Status.find(params[:id])
  rescue
    flash[:set_status_error] = "Could not find the record #{params[:id]}"
    redirect_to admin_statuses_path
  end
end