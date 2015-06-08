class IconsController < ApplicationController
  def index
    @icons = Icon.all.order(:name)
  end

  def search
    @icons = Icon.order(:name).where("name LIKE ?", "%#{params[:name]}%")
  end
end
