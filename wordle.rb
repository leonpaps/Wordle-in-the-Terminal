class Wordle
  require_relative "lexicon.rb"
  require "colorize"


  # debugging
  require 'pry'
  require 'json'
  # debugging

  def initialize(word)
    @word = word || Lexicon.new_word()
    @max_guesses = 6
    @guesses = []
    @winner = false
  end

  def play
    print_all_guesses
    while @guesses.length < @max_guesses && @winner == false do
      guess = gets.chomp.strip.split('').first(5).join

      if Lexicon.is_five_letter_word?(guess)
        attempt = process_attempt(guess)
        @guesses << attempt
      else
        print_error(guess)
      end

      print_all_guesses
    end

    if @winner
      puts "\n\n\n"
      congratulate
    else
      game_over
    end
  end

  def erase
    puts ""
    print ("\e[A\e[K"*3)
  end

  def process_attempt(guess)
    result = []

    guess.split('').each_with_index do |letter, index|
      if letter == @word[index]
        result << [letter, :green ]
      elsif @word.include?(letter)
        found_count = result.filter{|l,c| l == letter && c != :white }.count
        letter_count = @word.gsub(/[^${letter}]/, '').length
        if letter_count >= found_count
          result << [letter, :yellow ]
        else
          result << [letter, :white ]
        end
      else
        result << [letter, :white ]
      end
    end

    @winner = win?(result)
    result
  end

  def game_start
    puts  '+------------+'.yellow
    print '|'.yellow + ' let\'s play '.green + "|\n".yellow
    puts  '+------------+'.yellow
  end

  def congratulate
    puts  '+-----------------+'.yellow
    print '|'.yellow + ' congratulations '.green + "|\n".yellow
    puts  '+-----------------+'.yellow
  end

  def game_over
    puts  '+-----------+'.yellow
    print '|'.yellow + ' game over '.red + "|\n".yellow
    puts  '+-----------+'.yellow

    print "the word was " + @word.green
    puts ""

    puts "Feel free to try again".green
  end

  def win?(processed_attempt)
    processed_attempt.map{|_letter,color| color }.uniq == [:green]
  end

  def print_all_guesses
    system("cls") || system("clear")

    puts("Play Wordle in the command line".cyan)

    @guesses.each do |guess|
      color_print(guess)
    end
  end

  def print_error(guess)
    3.times do
      print_all_guesses
      yellow_red_print(guess)
      sleep(0.125)
      print_all_guesses
      red_yellow_print(guess)
    end
  end

  def yellow_red_print(guess)
    puts(guess.colorize(background: :yellow, color: :red) )
  end

  def red_yellow_print(guess)
    puts(guess.colorize(background: :red, color: :yellow) )
  end

  def color_print(letters)
    letters.each do |letter, color|
      print(letter.colorize(background: color, color: :black))
    end
    puts ""
  end

end

input = ARGV[0].to_s

if input == ""
  Wordle.new(nil).play
else
  Wordle.new(input).play
end
