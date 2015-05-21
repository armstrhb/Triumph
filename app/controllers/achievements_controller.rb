class AchievementsController < ApplicationController
  def index
    @realm = Realm.find(params[:realm_id])
    @achievements = Achievement.where(:realm => params[:realm_id])
    @new_achievement = Achievement.new
    @categories = Category.where(:realm => params[:realm_id])
    @rarities = Rarity.where(:realm => params[:realm_id])
  end

  def show
    @achievement = Realm.find(params[:id])

    respond_to do |format|
      format.html
      format.js{}
      format.json{render :json => { :realm => @achievement}}
    end
  end
end
