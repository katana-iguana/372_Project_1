=begin
    function valid_word(guess)
    
    This function validates that the guess is 5 characters long and 
    that each character is a letter.
=end
def valid_word(guess)
    return guess.length == 5 && /[A-Z][A-Z][A-Z][A-Z][A-Z]/.match(guess)
end


=begin
    function run_game()
    
    This function runs the 
=end
def run_game()
    word_guessed = false
    cur_word = "hello"
    while true

        if word_guessed
            break
        end
    
        puts "Please enter a your guess"
        guess = gets.strip
        guess = guess.upcase
        if valid_word(guess)
            puts "valid length"
        else
            puts "invalid length"

        end
        break
    end

end

def main()
    puts "----Welcome to WORDLE----"
    run_game()
end

main()

















