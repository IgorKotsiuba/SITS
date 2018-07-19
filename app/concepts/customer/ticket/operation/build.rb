class Customer::Ticket::Build < Trailblazer::Operation
  step Model(::Ticket, :new)
  step Contract::Build(constant: ::Customer::Ticket::MyCreate)
end
