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

Player.request_player_move(player1, board)
Player.request_player_move(player2, board)

