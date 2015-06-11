class GroupsController < ApplicationController
  respond_to :html, :js

  def index
    @groups = Group.all
    @new_group = Group.new
    @users = User.all
  end

  def show
    @group = Group.find(params[:id])
    @users = User.all
  end

  def new
    @group = Group.new
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    @group.save
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update_attributes(update_params)
  end

  def edit_roster
    @group = Group.find(params[:id])
  end

  def add_user
    @group = Group.find(params[:group])
    @user = User.find(params[:user])
    @result = false

    if !@group.users.include? @user
      @group.users << @user
      @result = true
    end
  end

  def remove_user
    @group = Group.find(params[:id])
    @user = User.find(params[:user_id])

    @group.users.delete(@user)
  end

  def destroy
    #nope, not doing this one yet.
  end

  private
    def group_params
      params.require(:group).permit(:name, :users, :admin_id)
    end

    def update_params
      params.require(:group).permit(:name, :admin_id)
    end
end
