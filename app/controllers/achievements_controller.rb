class AchievementsController < ApplicationController
  respond_to :html, :js

  def index
    @realm = Realm.find(params[:realm_id])
    @achievements = Achievement.where(:realm => params[:realm_id])
    @new_achievement = Achievement.new
    @categories = Category.where(:realm => params[:realm_id])
    @rarities = Rarity.where(:realm => params[:realm_id])
  end

  def show
    @achievement = Achievement.find(params[:id])
    @categories = Category.where(:realm => @achievement.realm)
    @rarities = Rarity.where(:realm => @achievement.realm)

    respond_to do |format|
      format.html
      format.js{}
      format.json{render :json => { :realm => @achievement}}
    end
  end

  def create
    @achievement = Achievement.new(get_create_params)
    @achievement.save

    @achievement
  end

  def update
    @achievement = Achievement.find(params[:id])
    @achievement.update_attributes(get_edit_params)
  end

  private
    def get_create_params
      params.require(:achievement).permit(:title, :description, :realm_id, :category_id, :rarity_id, :points, :required_ticks, :active_start, :active_end, :repeatable)
    end

    def get_edit_params
      get_create_params
    end
end
