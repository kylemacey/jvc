RSpec.describe JVC::Fixture do
  before(:all) do
    JVC.clear_registry
    require_relative "../fixture_examples/github/repository"
  end

  describe "#[]" do
    subject(:fixture) { JVC::Fixture[:repository] }

    it "returns the original type of the definition" do
      expect(fixture).to be_a(Sawyer::Resource)
    end

    it "returns the default value" do
      expect(fixture.full_name).to eq("rails/rails")
    end

    context "with a specified trait" do
      subject(:fixture) { JVC::Fixture[:repository, :personal] }

      it "returns the value for that trait" do
        expect(fixture.full_name).to eq("kylemacey/repo-contrib-graph")
      end
    end
  end
end