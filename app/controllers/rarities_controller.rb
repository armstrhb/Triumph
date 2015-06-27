class RaritiesController < ApplicationController
  respond_to :html, :js

  def index
    @realm = Realm.find(params[:id])
    @rarities = Rarity.where(:realm => params[:id]).order(rareness: :desc)

    @new_rarity = Rarity.new
    @new_rarity.realm = @realm
    @icons = Icon.all
  end

  def show
    @rarity = Rarity.find(params[:id])
    @icons = Icon.all
  end

  def create
    authorize_realm_admin(Realm.find(get_create_params[:realm_id]))
    @rarity = Rarity.new(get_create_params)

    if @rarity.save
      @rarity
    else
      render :json => {:errors => @rarity.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @rarity = Rarity.find(params[:id])
    authorize_realm_admin(@rarity.realm)

    if @rarity.update_attributes(update_params)
      @rarity
    else
      render :json => {:errors => @rarity.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_realm_admin(Rarity.find(params[:id]).realm)

    begin
      @rarity = Rarity.find(params[:id]).destroy
    rescue ActiveRecord::RecordNotFound
    end

    flash[:info] = "Rarity '#{@rarity.name}' deleted."
    redirect_to rarities_url @rarity.realm
  end

  private
    def get_create_params
      params.require(:rarity).permit(:name, :realm_id, :description, :color, :rareness, :icon_id)
    end

    def update_params
      params.require(:rarity).permit(:name, :description, :color, :rareness, :icon_id)
    end
end
