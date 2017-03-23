require "benchmark/ips"
require "bundler/setup"
require "logger"

# This 
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
    # Array of four largest integers.  Zero padded if input has fewer than four
    #    
    def max_four(integers)
      integers ||= [] # Handles nil arrays
      integers.inject([0,0,0,0]) do |accumulator, integer|
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