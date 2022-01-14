class PagesController < ApplicationController
  
  include PagesHelper
  before_action :set_cart_from_cookie

  def home  
    @products = Product.includes(:category).shuffle
    OrderMailer.with(product: Product.first).send_mail.deliver_later
  end

end
