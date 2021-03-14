class Api::V1::LocationsController < ApplicationController
  before_action :set_location, only: [ :show, :update, :destroy ]

  def index
    p params[:company_id]
    @locations = Location.where(company_id: params[:company_id])
    render json: {locations: @locations}
  end

  def create
    @location = Location.new(location_params)
    @location.company = Company.find(params[company_id])
    if @location.save!
      render :show
    else
      render_error
    end
  end

  def show
  end

  def update
    if @location.update(location_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    if @location.destroy
      render json: {message: 'location deleted successfully'}
    else
    end
  end

  private
  def set_location
    @location = Location.find(params[:id])
  end

  def render_error
    render json: { errors: @location.errors.full_messages },
      status: :unprocessable_entity
  end

  def location_params
    params.require(:location).permit(:name, :address)
  end
end
