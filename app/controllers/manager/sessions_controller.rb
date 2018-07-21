class Manager::SessionsController < Manager::BaseController
  before_action :block_authenticated_manager!, only: [:new, :create]
  before_action :authenticate_manager!, only: :destroy

  def new
    run ::Manager::Session::Build
    render cell(::Manager::Session::Cell::New, @form)
  end

  def create
    run ::Manager::Session::Create do
      session[:manager_id] = @model.id
      return redirect_to manager_tickets_path
    end
    render concept(::Manager::Session::Cell::New, @form)
  end

  def destroy
    session[:manager_id] = nil
    redirect_to manager_root_path
  end
end
