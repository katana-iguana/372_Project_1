=begin
    This function reads the word dictionary file data to create an array
    of words. It returns this array.
=end
def read_words()
    data = File.read("words.txt").split
    return data
end

=begin
    This function prompts the user to ask if they would like to read the 
    game instructions. If yes, then the instructions to the game are 
    displayed.
=end
def instructions()
    puts "Would you like to read the instructions? (y/N)"
    input = gets
    if input.nil?
      return
    end
    answer = input.strip
    # display instructions if user wants to see them
    if answer == "y"
        puts
        puts "WORDLE is a word-guessing game. For every round, a random five-letter\nword is chosen. You have to guess the word in 6 guesses. You cannot\nguess words you have guessed before, and every word must be a word\nin our dictionary. Below is an example of output if the actual word\nis \"yerba\" and the guess is \"kelpy\"."
        puts " --- --- --- --- --- "
        puts "| k | e | l | p | y |"
        puts " --- --- --- --- --- "
        puts " --- --- --- --- --- "
        puts "| X | C | X | X | I |"
        puts " --- --- --- --- --- "
        puts "\"C\" in the corresponding box below means the letter in the guess is\nin the correct spot. \"I\" means that the letter is in the word, but \nnot in the right spot. \"X\" means the letter is not in the word."
        puts
    end 
end

=begin
    function valid_word(guess)
    
    This function validates that the guess is 5 characters long, 
    that each character is a letter, that it is in the dictionary, and that
    it has not been guessed before.
=end
def valid_word(guess, words_list, guessed_words_list)
    
    if guess.length != 5
        puts "Invalid guess. Guess must be a 5 letters long."
        return false
    elsif !(/[a-z][a-z][a-z][a-z][a-z]/.match(guess))
        puts "Invaid guess. All characters in your guess must be alphabetic."
        return false
    elsif words_list.index(guess) == nil
        puts "Invalid guess. Guess not found in dictionary."
        return false
    elsif guessed_words_list.index(guess) != nil
        puts "Invalid guess. You already guessed this word."
        return false
    else
        return true
    end
end

=begin
    This function iterates through the guess and compares the letters to that
    of the word. It displays information regarding the player's accuracy to
    the actual word.
=end
def correct_letters(word, guess)
    # output display of word
    puts " --- --- --- --- --- "
    guess.each_char { |char|
        print "| #{char} "
    } 
    print "|\n"
    puts " --- --- --- --- --- "
    
    puts " --- --- --- --- --- "
    index = 0
    already_in_word = Array.new
    # loop through comparing guess to word
    while index < 5
        if word[index] == guess[index]
            print "| C "
        elsif word.index(guess[index]) != nil
            print "| I "
        else
            print "| X "
        end
        index += 1
    end
    print "|\n"
    puts " --- --- --- --- --- "

end

=begin
    function run_game()
    
    This function runs the game loop
=end
def run_game(words_list)
    guessed_words_list = Array.new
    guesses = 0
    rand_word = words_list[rand(words_list.length)]
    # game loop
    while true    
        puts "Please enter a your guess"
        guess = gets.strip.downcase
        if valid_word(guess, words_list, guessed_words_list)
            guesses += 1
            guessed_words_list.append(guess)
            if guess == rand_word
                if guesses == 1
                    puts "You guessed the word in 1 guess!"
                else
                    puts "You guessed the word in #{guesses} guesses!"
                end
                break
            elsif guesses == 6 
                puts "You did not guess the word in 6 guesses."
                puts "The word was #{rand_word}"
                break
            else
                correct_letters(rand_word, guess)
            end
        end
    end
    puts "Would you like to play again? (y/N)"
    play_again = gets.strip
    if play_again == "y"
        puts
        run_game(words_list)
    end
end

def main()
    puts "---- Welcome to WORDLE ----"
    read_words()
    file_data =  read_words()
    instructions()
    run_game(file_data)    
    puts "Thanks for playing WORDLE! Returning to main menu..."
    puts
    exec "ruby main.rb"
end

main()
