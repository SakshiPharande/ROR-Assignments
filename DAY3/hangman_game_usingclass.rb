# frozen_string_literal: true

load './dictionaries_class.rb'


class Game
  attr_accessor :levels, :current_level

  def initialize(levels)
    @levels = levels
    @current_level = 0
  end

  def start
    while current_level < levels.length
      puts "\n *********** Starting Level #{current_level + 1} **************"

      level = Level.new(levels[current_level])
      break unless level.play

      # Move to next level if successful
      self.current_level += 1

      # Exit game if player chooses to exit or loses

    end

    return unless current_level == levels.length

    # Completion message
    puts "\nCongratulations! You've completed all levels! WINNER !!!"
  end
end


class Level
  attr_accessor :word, :hint, :guessed_letters, :wrong_guesses, :max_attempts

  def initialize(level)
    @word, @hint = level.to_a.sample
    @guessed_letters = []
    @wrong_guesses = 0
    @max_attempts = 5
  end

  def play
    display_hint

    while wrong_guesses < max_attempts
      guess = user_guess

      # Exit game if user chooses to quit
      return false if guess == 'exit'

      next if already_guessed?(guess)

      guessed_letters << guess
      result = check_guess(guess)

      # If result is not -1, increment wrong guesses only for wrong guesses
      self.wrong_guesses += result if result == 1

      display_word

      if all_letters_guessed?
        puts "Congratulations! You've guessed the word '#{word}'. Moving to the next level... \n\n"
        return true
      end

      # Show used letters and remaining chances
      show_used_letters_and_chances
    end

    # End game message
    puts "\n\n\nGAME OVER! The correct answer was '#{word}'.\n\n"
    false
  end

  private

  def display_hint
    puts "\n HINT: #{hint}\n"
    puts '- ' * word.length
  end

  def user_guess
    print "\nGuess a letter or type 'exit' to quit: "
    gets.chomp.downcase
    # $stdin.gets.chomp.downcase
  end

  def already_guessed?(guess)
    if guessed_letters.include?(guess)
      puts "\nYou have already guessed '#{guess}'. Try again."
      return true
    end
    false
  end

  def check_guess(guess)
    if guess.strip.empty?
      puts 'Please type a letter instead of an empty space.'
      -1 # Return -1 to indicate no change in wrong guesses.
    elsif word.downcase.include?(guess)
      puts 'Correct Guess!'
      0  # Correct guess, no change in wrong guesses.
    else
      puts 'Wrong guess :('
      1  # Wrong guess, increment wrong guesses.
    end
  end

  def display_word
    displayed_word = word.chars.map do |char|
      guessed_letters.include?(char.downcase) ? char : '-'
    end.join(' ')

    # Print current state of the word
    puts displayed_word
  end

  def all_letters_guessed?
    word.chars.all? { |char| guessed_letters.include?(char.downcase) }
  end

  def show_used_letters_and_chances
    puts "You have used these letters: #{guessed_letters.join(', ')}"
    puts "You have remaining chances: #{max_attempts - wrong_guesses}\n\n"
  end
end

# Start the game with defined levels.
# Define levels to play through (assuming LEVEL1, LEVEL2, etc. are defined)
levels = [LEVEL1, LEVEL2, LEVEL3, LEVEL4, LEVEL5]
game = Game.new(levels)
puts "\n\n HangMan Game \n\n"
game.start
