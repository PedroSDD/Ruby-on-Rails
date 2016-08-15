module CurrentCart
  extend ActiveSupport::Concern    #module allows us to define methods, constants and other module and class definition

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound     #Rescue throws the exception
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

end
