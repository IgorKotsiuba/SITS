class Customer::Ticket::Cell::New < Trailblazer::Cell
  include SimpleForm::ActionViewExtensions::FormHelper
  include ActionView::Helpers::FormOptionsHelper

  property :contract

  def departments
    Department.all
  end
end
