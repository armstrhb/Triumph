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
  end

  def create
    authorize_realm_admin(Realm.find(get_create_params[:realm_id]))

    @achievement = Achievement.new(get_create_params)
    if @achievement.save
      @achievement
    else
      render :json => {:errors => @achievement.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize_realm_admin(Realm.find(get_create_params[:realm_id]))
    @achievement = Achievement.find(params[:id])

    if @achievement.update_attributes(get_edit_params)
      @achievement
    else
      render :json => {:errors => @achievement.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @achievement = Achievement.find(params[:id])
    authorize_realm_admin(@achievement.realm)

    begin
      @achievement.destroy
    rescue ActiveRecord::RecordNotFound
    end

    flash[:info] = "Achievement '#{@achievement.title}' deleted."
    redirect_to achievements_url @achievement.realm
  end

  private
    def get_create_params
      params.require(:achievement).permit(:title, :description, :realm_id, :category_id, :rarity_id, :points, :required_ticks, :active_start, :active_end, :repeatable)
    end

    def get_edit_params
      get_create_params
    end
end
