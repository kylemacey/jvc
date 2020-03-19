RSpec.describe JVC::DSL do
  describe ".fixture" do
    before { JVC.clear_registry }

    it "adds a new fixture definition to the fixture registry" do
      JVC.fixture(:repository) {}
      expect(JVC.registry).to have_key(:repository)
    end

    it "instantiates a fixture definition" do
      JVC.fixture(:repository) {}
      expect(JVC.registry[:repository]).to be_a(JVC::FixtureDefinition)
    end

    it "instantiates a fixture definition with a name" do
      JVC.fixture(:repository) {}
      expect(JVC.registry[:repository].name).to eq(:repository)
    end
  end
end