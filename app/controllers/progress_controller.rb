class ProgressController < ApplicationController
  helper ProgressHelper
  respond_to :html, :js, :json

  def get
    @progress = get_or_create_progress(params[:achievement_id], params[:user_id])
    respond_with(@progress)
  end

  def add
    @progress = get_or_create_progress(params[:achievement_id], params[:user_id])
    @ticks = params[:ticks].to_i

    while @ticks > 0
      if ! @progress.completed?
        if @ticks <= @progress.remaining
          @progress.ticks += @ticks
          @ticks = 0
        else
          @ticks -= @progress.remaining
          @progress.ticks += @progress.remaining
        end

        if @progress.completed?
          @progress.completed = true
          @progress.complete_date = Date.today
        end

        @progress.save
      end

      if @progress.completed? && @ticks > 0 && @progress.achievement.repeatable
        @progress = create_new_progress(params[:achievement_id], params[:user_id])
      else
        @ticks = 0
      end
    end

    respond_with(@progress)
  end

  def subtract
    # params[:achievement_id] params[:user_id] params[:ticks]
  end

  def grant
    @progress = get_or_create_progress(params[:achievement_id], params[:user_id])
    if @progress.completed? && @progress.achievement.repeatable
      @progress = create_new_progress(params[:achievement_id], params[:user_id])
    end

    if ! @progress.completed?
      @progress.grant
    end

    respond_with(@progress)
  end

  def forfeit
    @progress = get_or_create_progress(params[:achievement_id], params[:user_id])
    @progress.forfeit

    respond_with(@progress)
  end

  def get_total_points_all_realms
    @points = Progress.includes(:achievement).where(completed: true).sum(:points)
    render json: @points
  end

  def get_total_points_realm
    @points = Progress.includes(:achievement).where(completed: true, :achievements => { realm_id: params[:id]}).sum(:points)
    render json: @points
  end

  def get_total_points_for_user
    @points = Progress.includes(:achievement).includes(:user).where(completed: true, :users => { id: params[:id]}).sum(:points);
    render json: @points
  end

  def get_total_points_for_user_in_realm
    @points = Progress.includes(:achievement).includes(:user).where(completed: true, :users => { id: params[:user_id]}, :achievements => { realm_id: params[:realm_id]}).sum(:points);
    render json: @points
  end

  private
    def get_or_create_progress(achievement, user)
      @progress = Progress.where(:achievement => achievement, :user => user).last

      if @progress.nil?
        @progress = Progress.new(:achievement => Achievement.find(achievement), :user => User.find(user))
      end

      @progress
    end

    def create_new_progress(achievement, user)
      @progress = Progress.new(:achievement => Achievement.find(achievement), :user => User.find(user))
    end
end
