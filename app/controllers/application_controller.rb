class ApplicationController < ActionController::Base
  def current_manager
    @current_manager ||= Manager.find(session[:manager_id]) if session[:manager_id]
  end

  helper_method :current_manager
end
