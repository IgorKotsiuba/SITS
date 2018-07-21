class Manager::BaseController < ApplicationController
  def block_authenticated_manager!
    redirect_to manager_tickets_path if current_manager
  end

  def authenticate_manager!
    redirect_to manager_root_path unless current_manager
  end
end
