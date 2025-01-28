require './hangman_data.rb'

# Base class for Hangman
class Hangman
  attr_reader :levels

  def initialize(levels)
    @levels = levels
    @current_level = 0
  end

  # Start the game
  def start_game
    while @current_level < levels.length
      puts "\n *********** Starting Level #{@current_level + 1} **************"

      # Play the current level
      if play(levels[@current_level])
        @current_level += 1
      else
        break
      end
    end

    if @current_level == levels.length
      puts "\nCongratulations! You've completed all levels! WINNER!!!"
    end
  end

  private

  # Play a level
  def play(level)
    game = Level.new(level)
    game.start
  end
end

# Class for each level of the game
class Level
  attr_reader :word, :hint, :guessed_letters, :wrong_guesses, :max_attempts

  def initialize(level_data)
    @word, @hint = level_data.to_a.sample
    @word = @word.to_s
    @guessed_letters = []
    @wrong_guesses = 0
    @max_attempts = 5
  end

  # Start the level
  def start
    display_hint

    while wrong_guesses < max_attempts
      guess = get_user_guess

      return exit_game if guess == 'exit'

      if already_guessed?(guess)
        next
      end

      guessed_letters << guess
      @wrong_guesses += check_guess(guess)

      display_word

      if all_letters_guessed?
        puts "Congratulations! You've guessed the word '#{word}'. Moving to the next level...\n\n"
        return true
      end

      display_status
    end

    game_over
    false
  end

  private

  # Display the hint and word structure
  def display_hint
    puts "\nHINT: #{hint}"
    puts "- " * word.length
  end

  # Get user input for guesses
  def get_user_guess
    print "\nGuess a letter or type 'exit' to quit: "
    gets.chomp.downcase
  end

  # Check if the letter has already been guessed
  def already_guessed?(guess)
    unless guessed_letters.include?(guess)
      return false
    end
    puts "\nYou have already guessed '#{guess}'. Try again."
    true
  end


  # Check if the guess is correct
  def check_guess(guess)
    word.include?(guess) ? (puts "Correct guess!"; 0) : (puts "Wrong guess!"; 1)
  end


  # Display the current state of the word
  def display_word
    displayed_word = word.chars.map do |char|
      guessed_letters.include?(char.downcase) ? char : '-'
    end.join(' ')
    puts displayed_word
  end

  # Check if all letters in the word have been guessed
  def all_letters_guessed?
    word.chars.all? { |char| guessed_letters.include?(char.downcase) }
  end

  # Display the game status
  def display_status
    puts "You have used these letters: #{guessed_letters.join(', ')}"
    puts "You have remaining chances: #{max_attempts - wrong_guesses}"
  end

  # Handle game over
  def game_over
    puts "\n\nGAME OVER! The correct answer was '#{word}'.\n\n"
  end

  # Exit the game
  def exit_game
    puts "Exiting the game. Thank you for playing!"
    false
  end
end

# Inherit to create variations of the game
class AdvancedHangman < Hangman
  def initialize(levels, max_attempts = 5)
    super(levels)
    @max_attempts = max_attempts
  end
end

# Start the game
levels = [WordGameLevels::LEVEL1, WordGameLevels::LEVEL2, WordGameLevels::LEVEL3, WordGameLevels::LEVEL4, WordGameLevels::LEVEL5]
game = Hangman.new(levels)
game.start_game
