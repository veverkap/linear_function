defmodule CLI do
  def main(args) do
    args 
    |> Enum.at(0) 
    |> parse_args 
    |> process
  end

  @doc """
    Takes in a list of integers and returns out the greatest four, zero padded

    ## Examples
    iex> args = ""
    ...> CLI.parse_args(args)
    ** (RuntimeError) NO ARGUMENTS PASSED

    iex> args = "1"
    ...> CLI.parse_args(args)
    [1]

    iex> args = "1,2,3,4"
    ...> CLI.parse_args(args)
    [1,2,3,4]    
  """ 
  def parse_args(nil), do: raise "NO ARGUMENTS PASSED"
  def parse_args(""), do: raise "NO ARGUMENTS PASSED"
  def parse_args([]), do: raise "NO ARGUMENTS PASSED"
  def parse_args(args) do
    args 
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  def process(integers) do
    IO.puts "Processing #{inspect integers}"
    result = integers 
             |> LinearFunction.max_four

    IO.puts "Your result is #{inspect result}"
  end
end