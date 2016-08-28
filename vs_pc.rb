class Vs_pc
require_relative "win"

winner = Win.new

def get_user_code

  user_code = Array.new
  puts "Enter a 4-letter code (a-h) for the computer to guess: "
  user_code = gets.chomp
  user_code = user_code.split(",")
  
  return user_code
end

def trim_ai_letters(counter, winning_code, ai_letters)

  winning_code = winning_code
  ai_letters = ai_letters
  counter = counter
  
  case counter
  when 12
    ai_letters.delete("a") unless winning_code.include?("a")
  when 11
    ai_letters.delete("b") unless winning_code.include?("b")
  when 10
    ai_letters.delete("c") unless winning_code.include?("c")
  when 9
    ai_letters.delete("d") unless winning_code.include?("d")
  when 8
    ai_letters.delete("e") unless winning_code.include?("e")
  when 7
    ai_letters.delete("f") unless winning_code.include?("f")
  when 6
    ai_letters.delete("g") unless winning_code.include?("g")
  when 5
    ai_letters.delete("h") unless winning_code.include?("h")
  else
    #do nothing
  end
  return ai_letters
end

def get_comp_guesses(counter, in_guesses, winning_code, ai_letters)

  counter = counter - 4
  in_guesses = in_guesses
  winning_code = winning_code
  ai_letters = ai_letters
  correct_letter = 0
  r = Random.new

end

def set_temp_guesses(counter)

  temp_guesses = Array.new
  counter = counter
  
  case counter
  when 12
    temp_guesses = ["a", "a", "a", "a"]
  when 11
    temp_guesses = ["b", "b", "b", "b"]
  when 10
    temp_guesses = ["c", "c", "c", "c"]
  when 9
    temp_guesses = ["d", "d", "d", "d"]
  when 8
    temp_guesses = ["e", "e", "e", "e"]
  when 7
    temp_guesses = ["f", "f", "f", "f"]
  when 6
    temp_guesses = ["g", "g", "g", "g"]
  when 5
    temp_guesses = ["h", "h", "h", "h"]
  else
    #do nothing
  end

return temp_guesses
end


def get_comp_guesses(ai_letters)

  computer_guess = ai_letters.shuffle

  return computer_guess
end



end
