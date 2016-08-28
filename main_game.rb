require_relative "setup"
require_relative "win"
require_relative "vs_pc"
require_relative "validator"

class MainGame

  #guesses_board = Array.new
  #clues_board = Array.new
  #winning_code = Array.new

  in_guess = ["a", "a", "a", "a"]
  ai_letters = ["a", "b", "c", "d", "e", "f", "g", "h" ]
  game_over = false
  counter = 12
  game_mode = 0
  valid_input = false

  setup_game = Setup.new
  winner = Win.new
  vs = Vs_pc.new
  valid = Validator.new

  game_mode = winner.get_game_mode

  guesses_board = setup_game.generate_guesses_board
  clues_board = setup_game.generate_clues_board

  winner.display_game_board(guesses_board, clues_board, counter)

  if game_mode == 1
    winning_code = setup_game.generate_code
      until game_over || counter == 0
      
        in_guess = winner.get_input_guesses
        valid_input = valid.valid_input?(in_guess)

        until valid_input
          in_guess = winner.get_input_guesses
          valid_input = valid.valid_input?(in_guess)
        end

        game_over = winner.check_for_win(in_guess, winning_code, game_mode)
        guesses_board = winner.update_guesses_board(guesses_board, counter, in_guess)
        clues_board = winner.update_clues_board(clues_board, in_guess, counter, winning_code)
        winner.display_game_board(guesses_board, clues_board, counter)
        counter -=1
        puts "\nGood guess..... really, a lucky guess............... REALLY lucky." if in_guess == winning_code
        puts "\nThe code was #{winning_code.join(",")}.\nTry again next time!\n" if counter == 0 && in_guess != winning_code
      end

  elsif game_mode == 2
    winning_code = vs.get_user_code

    8.times do
      ai_letters = vs.trim_ai_letters(counter, winning_code, ai_letters)
      in_guess = vs.set_temp_guesses(counter)
      guesses_board = winner.update_guesses_board(guesses_board, counter, in_guess)
      clues_board = winner.update_clues_board(clues_board, in_guess, counter, winning_code)
      counter -= 1
    end
    
    until game_over || counter == 0
      in_guess = vs.get_comp_guesses(ai_letters)     
      game_over = winner.check_for_win(in_guess, winning_code, game_mode)  
      guesses_board = winner.update_guesses_board(guesses_board, counter, in_guess)
      clues_board = winner.update_clues_board(clues_board, in_guess, counter, winning_code)      
      counter -= 1
    end

    winner.display_game_board(guesses_board, clues_board, counter)
    puts "\nLooks like the computer whooped ya!" if in_guess == winning_code
    puts "\nYou somehow out-smarted Eddy's awesome AI!  I guess you win........" if counter == 0 && in_guess != winning_code
  
  else
    puts "Error - you must choose a 1 or 2.  Good-bye."
  end


end
