class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_seller, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :update, :destroy]


  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: "Product listed successfully!"
    else
      render :new
    end
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])
    if @product.update(product_params)
      redirect_to dashboard_index_path, notice: "Product updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    redirect_to dashboard_index_path, notice: "Product deleted successfully!"
  end

  private

  def set_product
    @product = current_user.products.find(params[:id])  # Ensures sellers can only edit their own products
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def authorize_seller
    redirect_to root_path, alert: "Only sellers can list products!" unless current_user.seller?
  end
end
