module JVC
  module DSL
    def fixture(key, &block)
      JVC.registry[key] = FixtureDefinition.new(key, &block)
    end
  end

  extend DSL
end