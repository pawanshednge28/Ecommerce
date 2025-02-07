module Admin
  class ProductsController < ApplicationController
    def index
      @products = Product.all
    end

    def update
      product = Product.find(params[:id])
      product.update(approved: params[:approved])
      redirect_to admin_products_path, notice: "Product updated!"
    end

  end
end
