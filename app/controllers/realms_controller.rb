class RealmsController < ApplicationController
  before_action :logged_in_user, only: [:show]
  respond_to :html, :js

  def index
    if ! logged_in?
      @realms = []
    elsif admin?
      @realms = Realm.all
      @new_realm = Realm.new
      @groups = Group.all
      @icons = Icon.all
    else
      @realms = current_user.realms
    end
  end

  def show
    @realm = Realm.find(params[:id])
    @total_points = get_total_points_for_realm(@realm.id)
    @recent_achievements = get_recent_achievements_in_realm(@realm.id)
    @top_users = get_top_point_users_in_realm(@realm.id)
    @icons = Icon.all
  end

  def get_total_points_for_realm(realm_id)
    Progress.includes(:achievement).where(completed: true, :achievements => { realm_id: realm_id}).sum(:points)
  end

  def get_top_point_users_in_realm(realm_id, limit=5)
    ActiveRecord::Base.connection.select_all("select users.name as user, users.email as email, sum(achievements.points) as points from progresses left join users on progresses.user_id = users.id left join achievements on progresses.achievement_id = achievements.id where achievements.realm_id = " + ActiveRecord::Base.sanitize(realm_id.to_s) + " and completed = 't' group by user order by points desc limit " + ActiveRecord::Base.sanitize(limit.to_s) + ";")
  end

  def get_recent_achievements_in_realm(realm_id, limit=5, age_limit=7)
    date_cutoff = Date.today
    Progress.includes(:achievement).includes(:user).where(completed: true, :achievements => { realm_id: realm_id}).where("complete_date > ?", date_cutoff.days_ago(age_limit)).order('complete_date desc').limit(limit);
  end

  def new
    @realm = Realm.new
    @groups = Group.all
  end

  def create
    authorize_admin
    @realm = Realm.new(realm_params)

    if @realm.save
      @realm
    else
      render :json => {:errors => @realm.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @realm = Realm.find(params[:id])
    authorize_realm_admin(@realm)

    respond_to do |format|
      format.html
      format.js{}
      format.json{render json: @realm}
    end
  end

  def update
    @realm = Realm.find(params[:id])
    authorize_realm_admin(@realm)

    respond_to do |format|
      if @realm.update_attributes(realm_params)
        format.html{redirect_to @realm, notice: 'Realm updated.'}
        format.js{}
        format.json{render json: @realm, status: :updated, location: @realm}
      else
        format.html{render action: 'show'}
        format.json{render json: @realm.errors, status: :unprocessable_entity}
      end
    end
  end

  def activate
    @realm = Realm.find(params[:id])
    authorize_realm_admin(@realm)

    @realm.active = true
    @realm.save

    @realm
  end

  def deactivate
    @realm = Realm.find(params[:id])
    authorize_realm_admin(@realm)

    @realm.active = false
    @realm.save

    @realm
  end

  def rename
    @realm = Realm.find(params[:id])
    authorize_realm_admin(@realm)

    if @realm.update_attributes(:name => rename_params[:name])
      @realm
    else
      render :json => {:errors => @realm.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def change_icon
    @realm = Realm.find(params[:id])
    authorize_realm_admin(@realm)

    @realm.icon = Icon.find(change_icon_params[:icon_id])
    @realm.color = change_icon_params[:color]

    @realm.save
  end

  def destroy
    authorize_realm_admin(Realm.find(params[:id]))

    begin
      @realm = Realm.find(params[:id]).destroy
    rescue ActiveRecord::RecordNotFound
    end

    flash[:info] = "Realm #{@realm.name} deleted."
    redirect_to realms_url
  end

  private
    def realm_params
      params.require(:realm).permit(:name, :active, :group_id, :icon_id, :color)
    end

    def rename_params
      params.require(:realm).permit(:name)
    end

    def change_icon_params
      params.require(:realm).permit(:icon_id, :color)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
