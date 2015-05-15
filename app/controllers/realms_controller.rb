class RealmsController < ApplicationController

  def index
    @realms = Realm.all
  end

  def show
    @realm = Realm.find(params[:id])
  end

  def new
    @realm = Realm.new
    @groups = Group.all
  end

  def create
    @realm = Realm.new(realm_params)
    if @realm.save
      redirect_to '/realms'
    else
      render 'new'
    end
  end

  def edit
    @realm = Realm.find(params[:id])
  end

  def update
    @realm = Realm.find(params[:id])
    if @realm.update_attributes(realm_params)
      redirect_to(:action => 'show', :id => @realm.id)
    else
      render 'edit'
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
