class PagesController < ApplicationController
  
  def home
    # 1. Preguntar si existe la variable cookies[:cart_id]
    if cookies[:cart_id]
      # SI existe: Buscar el registro de Cart según el cookies[:cart_id]
      # definir una variable @cart
      @cart = Cart.find(cookies[:cart_id])
    else
      # SINO existe: Crear un registro en Cart
      # asignar la cookie con el id
      @cart = Cart.create(total: 0)
      cookies[:cart_id] = @cart.id
    end
    
    # 2. Mostrar la cantidad de productos en el carrito
    
  end

end
