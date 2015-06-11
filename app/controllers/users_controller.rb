class UsersController < ApplicationController
  respond_to :html, :js

  def index
    @users = User.all
  end

  def index_for_realm
    @realm = Realm.find(params[:id])
    @users = User.joins("join realm_users on users.id = realm_users.user_id").where(["realm_users.realm_id = ?", params[:id]])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Triumph! You've made the right choice."
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit_password
    @user = User.find(current_user.id)
  end

  def update_password
    params = update_passwd_params

    if ! current_user.authenticate(params[:old_password])
      flash[:danger] = 'Incorrect Password.'
      render 'edit_password'
    else
      current_user.password = params[:password]
      current_user.password_confirmation = params[:password_confirmation]

      if current_user.save
        flash[:success] = "Password changed."
        redirect_to current_user
      else
        flash[:danger] = 'New password does not match confirmation.'
        render 'edit_password'
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def edit_realm_users
    @realm = Realm.find(params[:id])
  end

  def search
    if params[:realm_id].present?
      @realm = Realm.find(params[:realm_id])
    elsif params[:group_id].present?
      @group = Group.find(params[:group_id])
    end

    @users = User.order(:name).where("name LIKE ?", "%#{params[:name]}%")
  end

  def add_to_realm
    @user = User.find(params[:user])
    @realm = Realm.find(params[:realm])

    if !@user.realms.include?(@realm)
      @user.realms << @realm
    end

    @user
  end

  def remove_from_realm
    @user = User.find(params[:user])
    @realm = Realm.find(params[:realm])

    if @user.realms.include?(@realm)
      @user.realms.delete(@realm)
    end

    @user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def update_passwd_params
      params.require(:user).permit(:old_password, :password, :password_confirmation)
    end
end
