=begin
  quiz.rb
  Author: Evan Ohme
=end

class Question
  def initialize(line)
    @question, @opt1, @opt2, @opt3, @opt4, @ans = line
  end

  def ask()
    puts @question
    puts "  a) #{@opt1}"
    puts "  b) #{@opt2}"
    puts "  c) #{@opt3}"
    puts "  d) #{@opt4}\n\n"
    val = ""
    loop do
      print "Your answer (a, b, c, d): "
      val = gets.chomp
      if "abcd".include? val
        break
      else
        puts  "ERROR: Unrecognized answer. Please try again."
      end
    end
    return val == @ans
  end
end

class Quiz
  def initialize()
    @questions = get_questions
    @score = 0
    @num_questions = @questions.length
  end

  def play()
    @questions.each do |q|
      # ask a question, add to @score if the user answers correctly
      if q.ask
        @score += 1
        print "CORRECT! "
      else
        print "WRONG! "
      end
      puts "Your score is: #{@score}/#{@num_questions}\n\n"
    end

    if @score/@num_questions == 1
      puts "PERFECT SCORE! Good job!\n\n"
    end
  end

  def get_questions()
    questions = Array::new
    File.foreach('questions.txt') do |line|
      line = line.chomp.split('#')
      questions.push(Question.new(line))
    end
    return questions
  end
end

def main()
  puts "---- Welcome to RUBY QUIZ ----\n\n"
  quiz = Quiz.new
  quiz.play
  puts "Thanks for playing RUBY QUIZ! Returning to main menu...\n\n"
  exec "ruby main.rb"
end

if __FILE__ == $0
    main()
end
