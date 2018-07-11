class Client::ProductsController < ApplicationController
  def index
    search = params[:client_search]
    response = Unirest.get("localhost:3000/api/products",
      parameters: {
        search: search
      }
      )
    @products = response.body
    render "index.html.erb"
  end

  def show
    response = Unirest.get("localhost:3000/api/products")
    @product = response.body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    response = Unirest.post("localhost:3000/api/products", parameters:
    {
      input_name: params[:input_name],
      input_price: params[:input_price],
      input_image_url: params[:input_image_url],
      input_description: params[:input_description]
    }
    )

    @product = response.body
    p @product
    # flash [:success] = "You made a new recipe"
    render "show.html.erb"
    # redirect_to "client/products/#{@product['id']}"
  end

  def edit
    product_id = params[:id]
    response = Unirest.get("locahost:3000/api/products/#{recipe_id}")
    @product = response.body
    render "edit.html.erb"
  end

end
