module Manager::Ticket::Cell
  class SearchForm < Trailblazer::Cell
    include SimpleForm::ActionViewExtensions::FormHelper

    def item
      options[:item]
    end
  end
end
