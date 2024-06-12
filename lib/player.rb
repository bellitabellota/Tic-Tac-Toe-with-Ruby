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

  def self.request_player_move(player, board)
    puts "#{player.name} choose your move by entering the number of the field of your choice:"
    visualize_board(board)
    choice_player = gets.chomp

    # check if input is a number from 1 to 9

    until (1..9).any?(choice_player.to_i)
      puts "Invalid choice. Please enter the number that corresponds to the field of your choice:"
      choice_player = gets.chomp
    end

    # check which field of the board corresponds to the choice of the player and mark with the corresponding token

    board.each_with_index do | inner_array, outer_index |
      inner_array.each_with_index do | field_value, inner_index |
        if field_value == choice_player.to_i
          board[outer_index][inner_index] = player.player_token
          break board
        end
      end
    end
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