class Api::SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(:name => params[:session][:name])

    if user.present? && user.authenticate(params[:session][:password])
      render json: {token: ApiSessionBank.instance.add(user)[:token]}, status: 200
    else
      render json: {error: "Invalid username or password ;)" }, status: 422
    end
  end

end
