class CartsController < ApplicationController

  include PagesHelper
  before_action :set_cart_from_cookie # nos asginar la variable @cart

  def show
  end

  # POST /carts/:id_product
  def add_product
    # recuperar el id de cart -> cookie
    # recuperar el id del product
    # guardar el registro en CartProduct
    cart_product = CartProduct.new
    cart_product.cart = @cart
    cart_product.product_id = params[:id_product]
    cart_product.quantity = 1
    cart_product.save

    flash[:cart_product_created] = "Product added"
    redirect_to root_path
  end

end
