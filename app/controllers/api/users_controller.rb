class Api::UsersController < ApplicationController
  respond_to :json

  def show
    respond_with User.find(params[:id])
  end

  def progress_index
    respond_with User.find(params[:id]).progresses
  end

  def progress_show
    respond_with User.find(params[:id]).progresses.where(:achievement_id => params[:achievement_id])
  end
end
