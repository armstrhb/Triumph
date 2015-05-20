class AchievementsController < ApplicationController
  def index
    @realm = Realm.find(params[:realm_id])
    @achievements = Achievement.where(:realm => params[:realm_id])
    @new_achievement = Achievement.new
    @categories = Category.where(:realm => params[:realm_id])
    @rarities = Rarity.where(:realm => params[:realm_id])
  end
end
