class GroupsController < ApplicationController
  respond_to :html, :js

  def index
    @groups = Group.all
    @new_group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html{redirect_to @group, notice: 'Group created successfully.'}
        format.js{}
        format.json{render json: @group, status: :created, location: @group}
      else
        format.html{render action: 'new'}
        format.json{render json: @group.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html
      format.js{}
      format.json{render json: @group}
    end
  end

  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(group_params)
        format.html{redirect_to @group, notice: 'Group updated.'}
        format.js{}
        format.json{render json: @group, status: :updated, location: @group}
      else
        format.html{render action: 'show'}
        format.json{render json: @group.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    #nope, not doing this one yet.
  end

  private
    def group_params
      params.require(:group).permit(:name, :users)
    end
end
