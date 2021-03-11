class Api::V1::CompaniesController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [ :index ]
  before_action :set_company, only: [ :show, :update, :destroy ]

  def index
    @companies = Company.all
    render json: {companies: @companies}
  end

  def create
    @company = Company.new(company_params)
    if @company.save!
      render :show
    else
      render_error
    end
  end

  def show
  end

  def update
    if @company.update(company_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    if @company.destroy
      render json: {message: 'Company deleted successfully'}
    else
    end
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def render_error
    render json: { errors: @company.errors.full_messages },
      status: :unprocessable_entity
  end

  def company_params
    params.require(:company).permit(:name, :location, :service, categories: [], subcategories: [])
  end
end
