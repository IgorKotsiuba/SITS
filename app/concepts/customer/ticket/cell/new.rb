module Customer::Ticket::Cell
  class New < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::FormOptionsHelper

    property :contract

    def departments
      Department.all
    end
  end
end
