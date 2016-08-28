class Win
require_relative "setup"

  def check_for_win(in_guess, winning_code, game_mode)
    in_guess = in_guess
    winning_code = winning_code
    game_mode = game_mode
    
    if in_guess == winning_code
      return true
    else
      return false
    end
  end  
  
  def update_clues_board(clues_board, in_guess, counter, winning_code)
    clues_board = clues_board
    in_guess = in_guess
    counter = counter
    winning_code = winning_code

    winning_code.each_with_index do |code_val, code_index|
      in_guess.each_with_index do |guess_val, guess_index|
          if code_val == guess_val && code_index == guess_index
            clues_board[counter - 1][guess_index] = "!"
          elsif code_val == guess_val && code_index != guess_index
            clues_board[counter - 1][guess_index] = "#"
          #else
          end
      end
    end
   return clues_board
  end  
  
  def update_guesses_board(guesses_board, counter, in_guess)
    guesses_board = guesses_board
    counter = counter
    in_guess = in_guess
    in_guess.each_index do |e| 
      temp = in_guess[e]
      guesses_board[counter -1][e] = temp
    end
    
    return guesses_board    
  end  
  
  def display_game_board(guesses_board, clues_board, counter)
  
    guesses_board = guesses_board
    clues_board = clues_board
    counter = counter - 1
    clues_board[counter].sort!
    for i in 0..guesses_board.length-1
      print "\t#{guesses_board[i].to_s.gsub('"', '').gsub(",", "").gsub("[", "").gsub("]", "")}"
      print "\t\t #{clues_board[i].to_s.gsub('"', '').gsub(",", "").gsub("[", "").gsub("]", "")}"
      puts ""
    end
  
  end
  
  def get_input_guesses
  
    input_guesses = Array.new
    puts "Enter your code (four letters seperated by commas): "
    input = gets.chomp
    exit if input == 'q'
    input_guesses = input.split(",")
    return input_guesses
  end
  
  def get_game_mode
    puts "Enter '1' to guess a randomly generated code."
    puts "Enter '2' to create a code and see if the computer guesses correctly."
    game_mode = gets.chomp.to_i
  end
  
end
