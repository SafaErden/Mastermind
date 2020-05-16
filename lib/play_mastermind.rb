# frozen_string_literal: true

# No need to change or write any code in this file.
#
# After you complete all specs, you can simulate your game by
# running this file with `ruby lib/play_mastermind.rb` in your terminal!

require './lib/mastermind.rb'

puts 'Enter a size for the game: '
mastermind = Mastermind.new(gets.chomp.to_i)

puts '-------------------------' until mastermind.ask_user_for_guess

puts 'You win!'
