class RealmsController < ApplicationController
  def index
    @realms = Realm.all
    @new_realm = Realm.new
  end

  def show
    @realm = Realm.find(params[:id])

    respond_to do |format|
      format.html
      format.js{}
      format.json{render json: @realm}
    end
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
