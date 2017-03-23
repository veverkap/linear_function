require_relative "cli"
# Adding in a few helpers to Integer (aka monkey patching)
module IntegerHelpers
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end
  
# including these into integer
Integer.include IntegerHelpers

class LinearFunction
  class << self
    # Iterates through array of integers and returns the largest four
    # Should return same value as Array.max(4) in Ruby
    #
    # == Parameters:
    # integers::
    #   Array of 1 or more integers.  
    #
    # == Returns:
    # Array of four largest integers. 
    # If input has fewer than four integers, we pad with Integer::MIN
    #    
    def max_four(integers)
      integers ||= [] # Handles nil arrays
      integers.inject([Integer::MIN,Integer::MIN,Integer::MIN,Integer::MIN]) do |accumulator, integer|
        first, second, third, fourth = accumulator
        
        if integer > first
          # Passed in integer is greater than first, so insert it in 
          # the first place and push everything to the right
          [integer, first, second, third]
        elsif integer > second
          # Passed in integer is greater than second, so insert it in 
          # the second place, leave first alone and push everything 
          # to the right
          [first, integer, second, third]
        elsif integer > third
          # Passed in integer is greater than third, so insert it in 
          # the third place, leave first and second alone and push everything 
          # to the right
          [first, second, integer, third]
        elsif integer > fourth
          # Passed in integer is greater than fourth, so insert it in 
          # the fourth place, leave everything else alone
          [first, second, third, integer]
        else
          # Integer isn't greater than any of the numbers, so throw it away
          accumulator
        end
      end
    end 
  end
end

CLI.run if ARGV.length > 0