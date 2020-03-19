module JVC
  module Fixture
    def self.[](fixture_type, trait = nil)
      fixture_definition = JVC.registry[fixture_type]
      fixture_definition.for_trait(trait)
    end
  end
end