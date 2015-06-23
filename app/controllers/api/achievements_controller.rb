class Api::AchievementsController < ApplicationController
  respond_to :json

  def show
    respond_with Achievement.find(params[:id])
  end
end
