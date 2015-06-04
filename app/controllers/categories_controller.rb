class CategoriesController < ApplicationController
  respond_to :html, :xml, :json, :js

  def index
    puts "realm param: #{params[:realm_id]}"
    @categories = Category.where(:realm => params[:realm_id])
    @new_category = Category.new
    #@realm = Realm.find(params[:realm_id])

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

    @category.update_attributes(update_params)
  end

  def destroy
    begin
      @category = Category.find(params[:id]).destroy
    rescue ActiveRecord::RecordNotFound
    end

    flash[:notice] = "Category Removed."
    redirect_to categories_url
  end

  private
   def get_create_params
    params.require(:category).permit(:name, :description, :realm_id, :realm)
   end

   def update_params
     params.require(:category).permit(:name, :description, :realm_id, :realm)
   end
end
