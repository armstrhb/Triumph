class ProgressController < ApplicationController
  helper ProgressHelper

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
end
