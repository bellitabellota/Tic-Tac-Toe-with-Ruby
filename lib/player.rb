class Player
  @@total_number_players = 0
  @@available_player_tokens = ["X", "O"]
  @@remaining_token_after_first_players_choice = nil

  def self.total_number_players
    @@total_number_players
  end

  def self.available_player_tokens
    @@available_player_tokens
  end

  def self.create_player
    @@total_number_players += 1
    player_number = @@total_number_players

    puts "Please enter the name of Player #{player_number}:"
    name_player = gets.chomp

    if @@total_number_players == 1
      puts "Please choose your token (X or O):"
      token_player = gets.chomp

      until token_player == @@available_player_tokens[0] || token_player == @@available_player_tokens[1] do
        puts "Invalid choice. Please choose X or O as token:"
        token_player = gets.chomp
      end

      if @@available_player_tokens[1] == token_player
        @@remaining_token_after_first_players_choice = @@available_player_tokens[0]
      else
        @@remaining_token_after_first_players_choice = @@available_player_tokens[1]        
      end

    else
      token_player = @@remaining_token_after_first_players_choice
    end
    player = Player.new(name_player, token_player, player_number)
  end

  attr_reader :name, :player_token, :player_number
  
  def initialize(name, player_token, player_number)
    @name = name
    @player_token = player_token
    @player_number = player_number
  end

  def playerinformation
    puts "The token of #{self.name} is #{self.player_token} (Player #{player_number})."
  end
end