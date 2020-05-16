# frozen_string_literal: true

require './lib/code.rb'

class Mastermind
  def initialize(length)
    @length = length
    @secret_code = Code.random(@length)
  end

  def print_matches(instance)
    puts "#{@secret_code.num_exact_matches(instance)} exact matches"
    puts "#{@secret_code.num_near_matches(instance)} near matches"
  end

  def ask_user_for_guess
    print 'Enter a code: '
    val = Code.from_string(gets.chomp)
    print_matches(val)
    val == @secret_code
  end
end
