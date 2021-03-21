class Api::V1::CompaniesController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
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
    @count = get_count(@company.id)
    @total = get_total(@company.id)
    @featured = get_featured(@company.id)
    @attention = get_attention(@company.id)
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
  def get_total(id)
    total = 0
    products = Product.where(company_id: id)
    products.each do |prod|
      total += prod.quantity
    end
    return total
  end

  def get_count(id)
    array = []
    products = Product.where(company_id: id)
    products.each do  |prod|
      array << prod.quantity
    end
    return array.max
  end

  def get_featured(id)
    array = []
    products = Product.where(company_id: id)
    products.each do  |prod|
      array << prod.quantity
    end
    return products.filter { |prod| prod.quantity == array.max }.first
  end

  def get_attention(id)
    array = []
    products = Product.where(company_id: id)
    products.each do  |prod|
      array << prod.quantity
    end
    return products.filter { |prod| prod.quantity == array.min }.first
  end

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
