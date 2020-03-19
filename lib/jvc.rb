require "jvc/version"

require "jvc/dsl"
require "jvc/fixture_definition"
require "jvc/fixture"

module JVC
  class Error < StandardError; end
  # Your code goes here...

  def self.registry
    @registry || clear_registry
  end

  def self.clear_registry
    @registry = Hash.new
  end
end
