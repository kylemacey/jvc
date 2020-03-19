require "pry"
module JVC
  class FixtureDefinition
    attr_reader :name, :definition_proc

    def initialize(name, &definition_proc)
      @name = name
      @definition_proc = definition_proc
    end

    def for_trait(trait)
      trait_registry[trait || :default].call rescue binding.pry
    end

    private

    def trait_registry
      @trait_registry ||= TraitRegistry.new(&definition_proc)
    end

    class TraitRegistry < Hash
      def initialize(&block)
        self.instance_exec(&block)
      end

      def default(&block)
        trait(:default, &block)
      end

      def trait(name, &block)
        self[name] = block
      end
    end
  end
end