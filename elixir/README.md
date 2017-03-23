# Linear Functions And Algorithms In Elixir #

This folder includes the Elixir implementation of the assignment:

*Write a function that takes a list of integers and returns the 4 highest in O(n) time. We'd like to see how you think about algorithms and data structures, so as appropriate, use your own logic instead of calling out to libraries.*

One of the most beautiful things about Elixir is pattern matching and how that affords you the ability to leverage tail call optimization to speed things up.  However, for this assignment, we will still need to iterate over the list of integers in order to keep things O(n).

## How to Run Code ##

Here is how to run the code.

### Code Execution ###
Assuming you have Elixir and Erlang on your system, you can run the code by passing the array as a comma separated input argument to the linear_function executable
```bash
./linear_function 1,4,24,555,33,343,334
```
would return
```bash
Processing [1, 4, 24, 555, 33, 343, 334]
Result is [555, 343, 334, 33]
```

### Elixir Installation ###
So, you don't have Elixir installed.  Hmm.  That's not good.  

I really like [kiex](https://github.com/taylor/kiex) and would recommend you look at that to install it.

```bash
curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
kiex install 1.4
kiex use 1.4
```

There aren't any real dependencies for this, so you can just build the escript and then run it

```base
mix escript.build
./linear_function 1,4,24,555,33,343,334
```

### Tests ###
To run tests on the code, you just run
```bash
mix test
``` 