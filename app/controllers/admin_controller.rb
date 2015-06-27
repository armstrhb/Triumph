class AdminController < ApplicationController
  def index
    authorize_admin
  end

  def show_sys_config
    authorize_admin

    @sys_configs = SysConfig.all
    @update_sys_config = SysConfig.new
  end

  def update_sys_config
    authorize_admin
    @sys_config = SysConfig.where(:key => params[:sys_config][:key]).first

    if @sys_config.update_attributes(:value => params[:sys_config][:value])
      @sys_config
    else
      render :json => {:errors => @sys_config.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
