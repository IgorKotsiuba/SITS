require_dependency 'app/concepts/manager/message/contract/create_contract'

module Manager::Message
  class Build < Trailblazer::Operation
    step Model(::Message, :new)
    step Contract::Build(constant: CreateContract)
  end
end
