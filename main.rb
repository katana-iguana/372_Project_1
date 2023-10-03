#!/usr/bin/env ruby

class Input 
  def self.prompt
    print "> "
    return gets.strip
  end
end

if __FILE__ == $0
  puts "Welcome to Ruby Shell Games! What would you like to play?"
  puts "1. tic-tac-toe\n2. wordle\n3. TBD"
  puts "(Type the number or name of the game you would like to start.)"

  loop do
    case Input::prompt
      when "1", "tic-tac-toe"
        puts "TODO: starting tic-tac-toe..."
        break
      when "2", "wordle"
        puts "TODO: starting wordle..."
        break
      when "3", "TBD"
        puts "TODO: starting TBD..."
        break
    end
  end

end
