class Client::SessionsController < ApplicationController

  def new
  render 'new.html.erb'
  end

  def create
    client_params = {
                       email: params[:email],
                       password: params[:password]
                     }     

    response = Unirest.post(
                            "http://localhost:3000/api/sessions", 
                            parameters: client_params
                            )
    
    if response.code == 201
      session[:jwt] = response.body["jwt"]
      flash[:success] = 'Successfully logged in!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/client/login'
    end
  end

  def destroy
    session[:jwt] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/client/login'
  end
end
