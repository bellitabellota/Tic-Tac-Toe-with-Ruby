require_relative 'lib/player'

board = [[1, 2, 3],[4, 5, 6],  [7, 8, 9]]

def visualize_board(board)
  puts " #{board[0][0]} | #{board[0][1]} | #{board[0][2]} "
  puts "-----------"
  puts " #{board[1][0]} | #{board[1][1]} | #{board[1][2]} "
  puts "-----------"
  puts " #{board[2][0]} | #{board[2][1]} | #{board[2][2]} "
end

# initialize players

player1 = Player.create_player
player1.playerinformation

player2 = Player.create_player
player2.playerinformation

# Request player moves until game is finished or no empty fields remain

game_finished = false
empty_fields_remaining = true

until game_finished == true || empty_fields_remaining == false
  Player.request_player_move(player1, board)
  game_finished = Player.check_for_win(player1, board)
  empty_fields_remaining = board.flatten.any?(1..9)
  if empty_fields_remaining == false && game_finished == false
    visualize_board(board)
    puts "Draw! Reload the game if you want to try your luck again."
  end

  if game_finished == false && empty_fields_remaining == true
    Player.request_player_move(player2, board)
    game_finished = Player.check_for_win(player2, board)
    empty_fields_remaining = board.flatten.any?(1..9)
    if empty_fields_remaining == false && game_finished == false
      visualize_board(board)
      puts "Draw! Reload the game if you want to try your luck again."
    end
  end
end