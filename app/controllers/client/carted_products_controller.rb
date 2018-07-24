class Client::CartedProductsController < ApplicationController

  def new
    render 'show.html.erb'
  end

  def create
    response = Unirest.post("localhost:3000/api/products",
      parameters: {
      status: "Carted",
      user_id: : "5",
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: Order.id
      }
    )
   
  end
end
