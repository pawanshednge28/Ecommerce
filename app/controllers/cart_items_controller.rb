class CartItemsController < ApplicationController
  before_action :authenticate_user!

 def create
  cart = current_user.cart || current_user.create_cart
  item = cart.cart_items.find_or_initialize_by(product_id: params[:product_id])

  # ✅ Fix: Set default quantity if it's nil
  item.quantity = item.quantity.to_i + 1 
  item.save

  redirect_to cart_path(cart), notice: "Item added to cart!"
end


  def destroy
    cart = current_user.cart
    item = cart.cart_items.find(params[:id])
    item.destroy

    redirect_to cart_path(cart), notice: "Item removed from cart!"
  end
end
