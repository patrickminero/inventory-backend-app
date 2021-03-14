class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:update, :show, :destroy]
  def index
    @products = Product.where(company_id: params[:company_id])
  end
  
  def create
    if @product
      :update
    else
      @product = Product.new(product_params)
      company = Company.find(params[:company_id])
      @product.company = company
      if @product.save!
        render :show
      else
        render_error
      end
    end
  end

  def update
    if @product.update(product_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    if @product.destroy
      render json: {message: 'Product deleted!'}
    else
      head(:unprocessable_entity)
    end
  end

  def update_quantity
    @product = Product.find(params[:product_id])
    quantity = params[:quantity]
    @product.update_quantity(quantity)
    render json: { product: @product }
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def render_error
    render json: { errors: @product.errors.full_messages },
      status: :unprocessable_entity
  end

  def product_params
    params.require(:product).permit(:name, :quantity, :price, :description, :product_type, :sku, :category, :subcategory, product_attributes: {})
  end
end
