require_relative "../lib/player"

describe Player do
  describe "#create_player" do
    # This is a public class method that functions as Script and Command method -> Test that command is sent
    it "send message to create a player" do
      allow(Player).to receive(:increase_total_number_players_by_one).and_return(1)
      allow(Player).to receive(:gets).and_return("Oscar\n")
      allow(Player).to receive(:assign_player_token).and_return("X")

      expect(Player).to receive(:new).with("Oscar", "X", 1)
      Player.create_player
    end
  end

  describe "#increase_total_number_players_by_one" do
    it "increases @@total_number_players by 1" do
      expect { Player.increase_total_number_players_by_one }.to change { Player.total_number_players }.by(1)
    end
  end
end
