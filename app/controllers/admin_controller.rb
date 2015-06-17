class AdminController < ApplicationController
  def index
    authorize_admin
  end

  def show_sys_config
    authorize_admin
  end
end
