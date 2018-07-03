class Client::ProductsController < ApplicationController
  def index
    response = Unirest.get("localhost:3000/api/products")
    @products = response.body
    render "index.html.erb"
  end

  def show
    response = Unirest.get("localhost:3000/api/products")
    @product = response.body
    rendeer "show.html.erb"
  end

end
