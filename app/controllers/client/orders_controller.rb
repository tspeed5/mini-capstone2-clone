class Client::OrdersController < ApplicationController

  def show
    # order_id = params[:id]
    # response = Unirest.get("localhost:3000/api/orders/#{order_id}")
    # @order = response.body
    # render "show.html.erb"

    order_id = params[:id]
    response = Unirest.get("localhost:3000/api/orders/#{order_id}")
    @order = response.body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    # response = Unirest.post("localhost:3000/api/orders",
    #   parameters: {
    #     product_id: params[:input_product_id],
    #     quantity: params[:input_quanity]
    #   }
    # )
    # order = response.body
    # redirect_to "client/orders/#{order['id']}"

    response = Unirest.post("localhost:3000/api/orders",
      parameters: {
        product_id: params[:product_id],
        quantity: params[:quantity]
      }
    )
    order = response.body
    redirect_to "/client/orders/#{order['id']}"
  end
end
