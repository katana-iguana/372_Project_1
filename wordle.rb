def read_words()
    data = File.read("words.txt").split
    return data
end


=begin
    function valid_word(guess)
    
    This function validates that the guess is 5 characters long and 
    that each character is a letter.
=end
def valid_word(guess)
    return guess.length == 5 && /[a-z][a-z][a-z][a-z][a-z]/.match(guess)
end

=begin
    function run_game()
    
    This function runs the game loop
=end
def run_game(words_list)
    guesses = 0
    rand_word = words_list[rand(words_list.length)]
    puts "word to guess: " + rand_word #FOR TESTING; DELETE LATER
    while true    
        puts "Please enter a your guess"
        guess = gets.strip
        guess = guess.downcase
        if valid_word(guess)
            guesses += 1
            if guess == rand_word
                if guesses == 1
                    puts "You guessed the word in 1 guess!"
                else
                    puts "You guessed the word in #{guesses} guesses!"
                end
                break
            elsif guesses == 6 
                puts "You did not guess the word"
                break
            end
        else
            puts "Invalid word. Please enter a new guess"
        end
    end
    puts "Would you like to play again? (Y/n)"
    play_again = gets.strip
    if play_again == "Y"
        puts
        run_game(words_list)
    end
end

def main()
    puts "----Welcome to WORDLE----"
    read_words()
    file_data =  read_words()
    run_game(file_data)    

end

main()





