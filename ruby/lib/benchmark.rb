require_relative "linear_function"

optparse = OptionParser.new do |opts|
  opts.on("--benchmark-ruby", "Benchmarks against Ruby's Array.max(4) method") do |value|
    hundred_integers = (1..1_000_000).to_a.sample(100)
    Benchmark.ips do |x|
      x.report("Array.max(4) with 100 integers") { hundred_integers.max(4) }
      x.report("Code with 100 integers") { LinearFunction.max_four(hundred_integers) }
      x.compare!
    end
  end    

  opts.on("--benchmark", "Benchmarks multiples of 10") do |value|
    million = (1..1_000_000).to_a
    ten_integers = million.sample(10)
    hundred_integers = million.sample(100)
    thousand_integers = million.sample(1000)
    ten_thousand_integers = million.sample(10000)
    Benchmark.ips do |x|
      x.report("Code with array of 10 integers") { LinearFunction.max_four(ten_integers) }
      x.report("Code with array of 100 integers") { LinearFunction.max_four(hundred_integers) }
      x.report("Code with array of 1000 integers") { LinearFunction.max_four(thousand_integers) }
      x.report("Code with array of 10000 integers") { LinearFunction.max_four(ten_thousand_integers) }
      x.compare!
    end
  end  
end

optparse.parse!