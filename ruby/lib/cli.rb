class CLI
  class << self
    def run
      input = ARGV[0].split(",").map(&:to_i)
      puts "Processing #{input}"
      result = LinearFunction.max_four(input)
      puts "Result is #{result}"
    end
  end
end