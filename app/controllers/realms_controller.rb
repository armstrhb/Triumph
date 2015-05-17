class RealmsController < ApplicationController

  def index
    @realms = Realm.all
    @new_realm = Realm.new
  end

  def show
    @realm = Realm.find(params[:id])
    @total_points = get_total_points_for_realm(@realm.id)
    @recent_achievements = get_recent_achievements_in_realm(@realm.id)

    respond_to do |format|
      format.html
      format.js{}
      format.json{render :json => { :realm => @realm, :points => @total_points, :recent_achievements => @recent_achievements.to_json(include: [:achievement, :user])}}
    end
  end

  def get_total_points_for_realm(realm_id)
    Progress.includes(:achievement).where(completed: true, :achievements => { realm_id: realm_id}).sum(:points)
  end

  def get_top_point_users_in_realm(realm_id, limit=5)
    #TODO figure this one out
    #Progress.includes(:achievement).includes(:user)
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
    @realm = Realm.new(realm_params)

    respond_to do |format|
      if @realm.save
        format.html{redirect_to @realm, notice: 'Realm created successfully.'}
        format.js{}
        format.json{render json: @realm, status: :created, location: @realm}
      else
        format.html{render action: 'new'}
        format.json{render json: @realm.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @realm = Realm.find(params[:id])

    respond_to do |format|
      format.html
      format.js{}
      format.json{render json: @realm}
    end
  end

  def update
    @realm = Realm.find(params[:id])

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

  def destroy
    #nope, not doing this one yet.
  end

  private
    def realm_params
      params.require(:realm).permit(:name, :active, :group)
    end
end
