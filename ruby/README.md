# Linear Functions And Algorithms In Ruby #

This folder includes the Ruby implementation of the assignment:

*Write a function that takes a list of integers and returns the 4 highest in O(n) time. We'd like to see how you think about algorithms and data structures, so as appropriate, use your own logic instead of calling out to libraries.*

Normally, in Ruby, we would just call out to `Array.max(n)` to get the four largest times.  But we are encouraged not to use the standard libraries, so that rules out Array.max.  Also, reading the [Ruby source](https://ruby-doc.org/core-2.2.6/Enumerable.html#method-i-max), we can see that, while it is incredibly performant (given that it is in C), it is not really O(n) so it would fail that requirement as well.

```c
static VALUE
enum_max(int argc, VALUE *argv, VALUE obj)
{
    NODE *memo = NEW_MEMO(Qundef, 0, 0);
    VALUE result;
    VALUE num;

    rb_scan_args(argc, argv, "01", &num);

    if (!NIL_P(num))
       return nmin_run(obj, num, 0, 1);

    if (rb_block_given_p()) {
        rb_block_call(obj, id_each, 0, 0, max_ii, (VALUE)memo);
    }
    else {
        rb_block_call(obj, id_each, 0, 0, max_i, (VALUE)memo);
    }
    result = memo->u1.value;
    if (result == Qundef) return Qnil;
    return result;
}
```

So, keeping this O(n) while not using any of the core library means that we are going to iterate over the entire array and have some accumulator object that we use to maintain "state".  I chose to use an Array for the accumulator since I could handle ordering of the accumulator myself that way.  And the best Ruby method for iterating over an Enumerable and accumulating a result is `inject` (aka `reduce`).  `each_with_object` would also be a contender, but in my benchmarks, it didn't have any discernable difference and seems to be better suited for use with Hashes than Arrays.

## Documentation ##
In the /doc folder are Yard generated documentation files if you prefer to read them in HTML vs. inline

## How to Run Code ##

Now that you are done with my pontification :), here is how to run the code.

### Code Execution ###
You can run the code by passing the array as a comma separated input argument to the lib/linear_function.rb file
```bash
ruby lib/linear_function.rb 1,4,24,555,33,343,334
```
would return
```bash
Processing [1, 4, 24, 555, 33, 343, 334]
Result is [555, 343, 334, 33]
```

### Bundle Install ###
I'm using Ruby 2.2.6 with rbenv and bundler.  These gems are only needed for tests and benchmarks.  

You can install the bundled gems by running
```bash
bundle install
```

### Tests ###
To run tests on the code, you can either 
```bash
bundle exec ruby test/linear_function_test.rb
``` 
or use the Rake task 
```bash
bundle exec rake test
```

### Benchmarks ###
To see benchmarks against the ruby Array.max method, you can run
```bash
bundle exec ruby lib/benchmark.rb --benchmark-ruby
```
which will use the `benchmark/ips` gem to exercise the code and see performance metrics.  SPOILER: My code is slower than Array.max.

To see benchmarks of the code against larger integer arrays, you can run
```bash
bundle exec ruby lib/benchmark.rb --benchmark
```
and that will try 10,100,1000 and 10,000 integers against my code.  While not precisely linear, it shows that the differences in size of the array are nearly linear.