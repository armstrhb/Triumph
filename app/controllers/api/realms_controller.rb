class Api::RealmsController < ApplicationController
  respond_to :json

  def index
    respond_with Realm.all
  end

  def show
    respond_with Realm.find(params[:id])
  end

  def users
    respond_with Realm.find(params[:id]).users
  end

  def achievements
    respond_with Realm.find(params[:id]).achievements
  end

  def rarities
    respond_with Realm.find(params[:id]).rarities
  end

  def categories
    respond_with Realm.find(params[:id]).categories
  end
end
