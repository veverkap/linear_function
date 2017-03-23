defmodule LinearFunction do
  # These are default minimum integers for a 64 bit machine.  These may not be 
  # truly minimum depending on your memory specifications
  @default_values [-576460752303423489, 
                   -576460752303423489, 
                   -576460752303423489, 
                   -576460752303423489]

  @doc """
    Takes in a list of integers and returns out the greatest four, zero padded

    ## Examples
    iex> item = []
    ...> LinearFunction.max_four(item)
    [0,0,0,0]

    iex> item = [1,2,3]
    ...> LinearFunction.max_four(item)
    [3,2,1,0]

    iex> item = [100,252,343,1,553,434]
    ...> LinearFunction.max_four(item)
    [553, 434, 343, 252]    

    iex> item = Random.sample((1..10000), 5)
    ...> LinearFunction.max_four(item)
    [9941, 9873, 9293, 8666] #this is fixed because of the seed  
  """
  def max_four(list) do
    list
    |> Enum.reduce(@default_values, fn(integer, accumulator) -> 
      place_integer(integer, accumulator)
    end)
    |> zero_mins
  end

  @doc """
    Places the integer in the list when the integer is greater than the first

    ## Examples
    iex> LinearFunction.place_integer(5, [0,0,0,0])
    [5,0,0,0]

  """
  def place_integer(integer, [first, second, third, _]) when integer > first do
    [integer, first, second, third]
  end

  @doc """
    Places the integer in the list when the integer is greater than the second

    ## Examples
    iex> LinearFunction.place_integer(5, [6,0,0,0])
    [6,5,0,0]    
  """
  def place_integer(integer, [first, second, third, _]) when integer > second do
    [first, integer, second, third]
  end

  @doc """
    Places the integer in the list when the integer is greater than the third

    ## Examples
    iex> LinearFunction.place_integer(5, [7,6,0,0])
    [7,6,5,0]    
  """
  def place_integer(integer, [first, second, third, _]) when integer > third do
    [first, second, integer, third]
  end

  @doc """
    Places the integer in the list when the integer is greater than the fourth

    ## Examples
    iex> LinearFunction.place_integer(5, [8,7,6,0])
    [8,7,6,5]
  """
  def place_integer(integer, [first, second, third, fourth]) when integer > fourth do
    [first, second, third, integer]
  end  

  @doc """
    Doesn't place anything when it's not greater than anything

    ## Examples
    iex> LinearFunction.place_integer(5, [9,8,7,6])
    [9,8,7,6]
  """
  def place_integer(_, [first, second, third, fourth]) do
    [first, second, third, fourth]
  end  

  @doc """
    Cleans up minimum integer in first column

    ## Examples
    iex> LinearFunction.zero_mins([-576460752303423489,8,7,6])
    [0,8,7,6]
  """
  def zero_mins([first, second, third, fourth]) when first  == -576460752303423489, do: zero_mins([0, second, third, fourth])

  @doc """
    Cleans up minimum integer in second column

    ## Examples
    iex> LinearFunction.zero_mins([9, -576460752303423489,8,7])
    [9,0,8,7]
  """
  def zero_mins([first, second, third, fourth]) when second == -576460752303423489, do: zero_mins([first, 0, third, fourth])

  @doc """
    Cleans up minimum integer in second column

    ## Examples
    iex> LinearFunction.zero_mins([9, 8, -576460752303423489,7])
    [9,8,0,7]
  """
  def zero_mins([first, second, third, fourth]) when third  == -576460752303423489, do: zero_mins([first, second, 0, fourth])

  @doc """
    Cleans up minimum integer in fourth column

    ## Examples
    iex> LinearFunction.zero_mins([9,8,7,-576460752303423489])
    [9,8,7,0]
  """
  def zero_mins([first, second, third, fourth]) when fourth == -576460752303423489, do: zero_mins([first, second, third, 0])

  @doc """
    Doesn't change anything if there isn't anything to change

    ## Examples
    iex> LinearFunction.zero_mins([9,8,7,6])
    [9,8,7,6]
  """
  def zero_mins([first, second, third, fourth]), do: [first, second, third, fourth]
end
