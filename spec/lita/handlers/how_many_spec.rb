require "spec_helper"

describe Lita::Handlers::HowMany, lita_handler: true do
  it { is_expected.to route_command("how many experience does amaninacan have?").to(:how_many) }

  describe "#how_many" do
    it "responds with a number between 1 and 100" do
      send_command("how many experience does amaninacan have?")

      expect('0'...'10').to include(replies.last)
    end

    context "when the bounds have been set manually" do
      before do
        registry.configure do |config|
          config.handlers.how_many.lower_bound = 5
          config.handlers.how_many.upper_bound = 6
        end
      end

      it "responds with a number between the specified bounds" do
        send_command("how many experience does amaninacan have?")

        expect(replies.last).to eq('5')
      end
    end

    context "when the bounds are equal" do
      before do
        registry.configure do |config|
          config.handlers.how_many.lower_bound = 5
          config.handlers.how_many.upper_bound = 5
        end
      end

      it "logs an error" do
        expect(Lita.logger).to receive(:error).with(
          "lita-how-many: upper_bound (5) must be greater than lower_bound (5)."
        )

        send_command("how many experience does amaninacan have?")
      end
    end
  end
end
