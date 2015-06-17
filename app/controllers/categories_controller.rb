class CategoriesController < ApplicationController
  respond_to :html, :xml, :json, :js

  def index
    @realm = Realm.find(params[:realm_id])
    @categories = Category.where(:realm => params[:realm_id])

    @new_category = Category.new
    @new_category.realm = @realm
  end

  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html
      format.js{}
      format.json{render :json => { :realm => @category}}
    end
  end

  def create
    authorize_realm_admin(Realm.find(get_create_params[:realm_id]))

    @category = Category.new(get_create_params)
    @category.save

    @category
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    authorize_realm_admin(@category.realm)

    @category.update_attributes(update_params)
  end

  def destroy
    authorize_realm_admin(Category.find(params[:id]).realm)

    begin
      @category = Category.find(params[:id]).destroy
    rescue ActiveRecord::RecordNotFound
    end

    flash[:notice] = "Category Removed."
    redirect_to categories_url
  end

  private
   def get_create_params
    params.require(:category).permit(:name, :realm_id, :description)
   end

   def update_params
     params.require(:category).permit(:name, :description)
   end
end
