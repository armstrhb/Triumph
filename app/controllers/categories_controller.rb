class CategoriesController < ApplicationController
  respond_to :html, :xml, :json, :js

  def index
    @realm = Realm.find(params[:realm_id])
    @categories = Category.where(:realm => params[:realm_id])

    @new_category = Category.new
    @new_category.realm = @realm
    @icons = Icon.all
  end

  def show
    @category = Category.find(params[:id])
    @icons = Icon.all
  end

  def create
    authorize_realm_admin(Realm.find(get_create_params[:realm_id]))

    @category = Category.new(get_create_params)
    if @category.save
      @category
    else
      render :json => {:errors => @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    authorize_realm_admin(@category.realm)

    if @category.update_attributes(update_params)
      @category
    else
      render :json => {:errors => @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_realm_admin(Category.find(params[:id]).realm)

    begin
      @category = Category.find(params[:id]).destroy
    rescue ActiveRecord::RecordNotFound
    end

    flash[:info] = "Category '#{@category.name}' Removed."
    redirect_to categories_url @category.realm
  end

  private
   def get_create_params
    params.require(:category).permit(:name, :realm_id, :description, :color, :icon_id)
   end

   def update_params
     params.require(:category).permit(:name, :description, :color, :icon_id)
   end
end
