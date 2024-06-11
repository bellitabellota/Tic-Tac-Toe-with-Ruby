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

#request move player 1

puts "#{player1.name} choose your move by entering the number of the field of your choice:"
visualize_board(board)
choice_player1 = gets.chomp

# check if input is a number from 1 to 9

until (1..9).any?(choice_player1.to_i)
  puts "Invalid choice. Please enter the number that corresponds to the field of your choice:"
  choice_player1 = gets.chomp
end

# check which field of the board corresponds to the choice of player1 and mark with the corresponding token

board.each_with_index do | inner_array, outer_index |
  inner_array.each_with_index do | field_value, inner_index |
    if field_value == choice_player1.to_i
      board[outer_index][inner_index] = player1.player_token
      break board
    end
  end
end

#request move player 2

puts "#{player2.name} choose your move by entering the number of the corresponding field:"
visualize_board(board)
choice_player2 = gets.chomp

until (1..9).any?(choice_player1.to_i)
  puts "Invalid choice. Please enter the number that corresponds to the field of your choice:"
  choice_player2 = gets.chomp
end

board.each_with_index do | inner_array, outer_index |
  inner_array.each_with_index do | field_value, inner_index |
    if field_value == choice_player2.to_i
      board[outer_index][inner_index] = player2.player_token
      break board
    end
  end
end

visualize_board(board)
