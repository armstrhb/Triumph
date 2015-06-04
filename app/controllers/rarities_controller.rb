class RaritiesController < ApplicationController
  def index
    @realm = Realm.find(params[:id])
    @rarities = Rarity.where(:realm => params[:id])

    @new_rarity = Rarity.new
    @new_rarity.realm = @realm
  end

  def show
    @rarity = Rarity.find(params[:id])
  end

  def create
    @rarity = Rarity.new(get_create_params)
    @rarity.save

    @rarity
  end

  def update
    @rarity = Rarity.find(params[:id])
    @rarity.update_attributes(update_params)
  end

  def destroy
    begin
      @rarity = Rarity.find(params[:id]).destroy
    rescue ActiveRecord::RecordNotFound
    end

    flash[:notice] = "Rarity deleted."
    redirect_to rarities_url
  end

  private
    def get_create_params
      params.require(:rarity).permit(:name, :realm_id, :description)
    end

    def update_params
      params.require(:rarity).permit(:name, :description)
    end
end
