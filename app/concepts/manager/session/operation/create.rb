module Manager::Session
  class Create < Trailblazer::Operation
    step Nested(Build)
    step self::Contract::Validate(key: :manager)
    step :setup_model!

    def setup_model!(options, *)
      options['model'] = options['contract.default'].manager
    end
  end
end
