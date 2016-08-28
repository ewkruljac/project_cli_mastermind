class Validator

  def valid_input?(user_guess)

    valid_input = false

    valid_length = valid_length?(user_guess)
    valid_letters = valid_letters?(user_guess)


    if valid_letters && valid_length
      valid_input = true
    else
      valid_input = false
    end

    return valid_input
  end



  def valid_length?(user_guess)

    if user_guess.length != 4
      puts "You must enter 4 letters.  Try again."
      return false
    else
      return true
    end

  end



  def valid_letters?(user_guess)

    valid_letters = false

    user_guess.each do |e|
          
      if e.between?('a', 'h') && e.length == 1
        valid_letters = true
      else
        puts "You must enter a - h."
        valid_letters = false
        break
      end

    end

    return valid_letters
  end

end