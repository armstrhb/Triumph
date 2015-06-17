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

    @sys_config.value = params[:sys_config][:value]
    @sys_config.save

    @sys_config
  end
end
