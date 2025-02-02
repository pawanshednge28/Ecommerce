class DashboardController < ApplicationController
  before_action :authenticate_user!  # Ensures only logged-in users can access

  def index
    if current_user.seller?
      @products = current_user.products  # Sellers see their own products
    else
      @products = Product.all  # Buyers see all available products
    end
  end

end
