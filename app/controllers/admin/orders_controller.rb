module Admin
  class OrdersController < ApplicationController
    def index
      @orders = Order.all
    end

    def update
      order = Order.find(params[:id])
      order.update(status: params[:status])
      redirect_to admin_orders_path, notice: "Order status updated!"
    end

    def update
      product = Product.find(params[:id])
      
      if params[:approved] == "true"
        product.update(approved: true)
        flash[:notice] = "Product approved successfully!"
      elsif params[:approved] == "false"
        product.update(approved: false)
        flash[:alert] = "Product rejected!"
      end

      redirect_to admin_products_path
    end
    
  end
end
