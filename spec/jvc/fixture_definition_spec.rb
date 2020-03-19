RSpec.describe JVC::FixtureDefinition do
  subject(:fixture_definition) { described_class.new("test", &definition_proc) }
  let(:definition_proc) { Proc.new {} }

  describe "initialize" do
    it "accepts a name" do
      expect(fixture_definition.name).to eq("test")
    end

    it "receives and stores a definition proc" do
      expect(fixture_definition.definition_proc).to eq(definition_proc)
    end
  end

  describe "#for_trait" do
    subject { fixture_definition.for_trait(trait) }

    let(:definition_proc) do
      Proc.new do
        default { "Hello World" }
        trait(:goodbye) { "Goodbye World" }
      end
    end

    context "with a nil trait" do
      let(:trait) { nil }

      it "returns the value of the default trait" do
        is_expected.to eq("Hello World")
      end
    end

    context "with a :default trait" do
      let(:trait) { :default }

      it "returns the value of the default trait" do
        is_expected.to eq("Hello World")
      end
    end

    context "with a specific trait" do
      let(:trait) { :goodbye }

      it "returns the value of that trait" do
        is_expected.to eq("Goodbye World")
      end
    end
  end
end