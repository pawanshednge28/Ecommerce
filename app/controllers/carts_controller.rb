
class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart || current_user.create_cart
  end

  def checkout
    @cart = current_user.cart
    order = Order.create(user: current_user, status: :pending)

    @cart.cart_items.each do |item|
      order.order_items.create(product: item.product, quantity: item.quantity, price: item.product.price)
    end

    @cart.cart_items.destroy_all
    redirect_to order_path(order), notice: "Order placed successfully!"
  end
end
