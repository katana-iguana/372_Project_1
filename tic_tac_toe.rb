=begin
    tic_tac_toe.rb
    Author: Brooke Adkins
=end

class TicTacToe

    def initialize() 
        @game_board = make_board
        @game_board_pos = make_game_board_pos
    end

    def play()
        puts "These are the rows and cols for the game board"
        puts "Please type in the (row,col) to place an 'X'\n\n"
        @game_board_pos.each do |row|
            print "           "
            row.each do |col|
                print " #{col} "
            end
            print "\n"
        end
        print "\n\n"

        input = gets
        if input.nil?
            return
        end
        
        answer = input.strip
        if @game_board_pos.include?(answer)
            print "yes"
        end
    end

    def print_board()
        @game_board.each do |row|
            print "                 "
            row.each do |col|
                print " #{col} "
            end
            print "\n"
        end
        print "\n\n"
    end

    def make_game_board_pos() 
        game_board_pos = [["(0,0)", "(0,1)", "(0,2)"], ["(1,0)", "(1,1)", "(1,2)"], ["(2,0)", "(2,1)", "(2,2)"]];
        return game_board_pos
    end

    def make_board()
        game_board = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]];
        return game_board
    end

end

def main() 
    puts "---- Welcome to RUBY TIC TAC TOE ----\n\n"
    tic_tac_toe = TicTacToe.new
    tic_tac_toe.print_board
    tic_tac_toe.play
    puts "Thanks for playing tic tac toe quiz! Returning to main menu...\n\n"
    exec "ruby main.rb"
end

main



