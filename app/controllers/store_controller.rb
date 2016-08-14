class StoreController < ApplicationController
  def index
    @products = Product.order(:title)     # @ sign means that we are dealing with an object of the class
  end                                     #Notice that by doing order(:title) we are ordering by alphabetical order
end
