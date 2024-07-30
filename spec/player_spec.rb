require_relative "../lib/player"

describe Player do
  describe "#create_player" do
    # This is a public class method that functions as Script and Command method -> Test that command is sent
    it "send message to create a player" do
      allow(Player).to receive(:increase_total_number_players_by_one).and_return(1)
      allow(Player).to receive(:gets).and_return("Oscar\n")
      allow(Player).to receive(:assign_player_token).and_return("X")
      allow(Player).to receive(:puts)

      expect(Player).to receive(:new).with("Oscar", "X", 1)
      Player.create_player
    end
  end

  describe "#increase_total_number_players_by_one" do
    it "increases @@total_number_players by 1" do
      expect { Player.increase_total_number_players_by_one }.to change { Player.total_number_players }.by(1)
    end
  end
=begin
  describe "#assign_player_token" do
    context "when player 1 choses X" do
      before do
        allow(Player).to receive(:request_player_token_choice).and_return("X")
        allow(Player).to receive(:update_remaining_tokens)
      end

      context "when no token was assigned" do
        it "it returns player 1's token choice" do
          Player.total_number_players = 1 #####?
          expect(Player.assign_player_token).to eq("X")
        end
      end

      context "when a token was already assigned to player 1" do
        xit "it assigns remaining token to player 2" do
          expect(Player.assign_player_token).to eq("O")
        end
      end
    end



    context "when a token was already assigned to player 1" do
      xit "it assigns remaining token to player 2" do
      end
    end
  end

  ## request_player_token_choice
  ## 
=end
end
