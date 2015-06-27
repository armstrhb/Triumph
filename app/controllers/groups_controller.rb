class GroupsController < ApplicationController
  respond_to :html, :js

  def index
    authorize_admin

    @groups = Group.all
    @new_group = Group.new
    @users = User.all
  end

  def show
    @group = Group.find(params[:id])
    authorize_group_member(@group)

    @users = User.all
  end

  def new
    authorize_admin

    @group = Group.new
    @groups = Group.all
  end

  def create
    authorize_admin

    @group = Group.new(group_params)
    if @group.save
      @group
    else
      render :json => {:errors => @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    authorize_group_admin(@group)

    if @group.update_attributes(update_params)
      @group
    else
      render :json => {:errors => @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit_roster
    @group = Group.find(params[:id])
    authorize_group_admin(@group)
  end

  def add_user
    @group = Group.find(params[:group])
    authorize_group_admin(@group)

    @user = User.find(params[:user])
    @result = false

    if !@group.users.include? @user
      @group.users << @user
      @result = true
    end
  end

  def remove_user
    @group = Group.find(params[:id])
    authorize_group_admin(@group)

    @user = User.find(params[:user_id])

    @group.users.delete(@user)
  end

  def destroy
    authorize_admin

    begin
      @group = Group.find(params[:id]).destroy
    rescue ActiveRecord::RecordNotFound
    end

    flash[:info] = "Group '#{@group.name}' deleted."
    redirect_to groups_path
  end

  private
    def group_params
      params.require(:group).permit(:name, :users, :admin_id)
    end

    def update_params
      params.require(:group).permit(:name, :admin_id)
    end
end
