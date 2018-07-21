module Manager::Session::Cell
  class New < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper
    include ActionView::Helpers::FormOptionsHelper

    property :username
    property :password
  end
end
