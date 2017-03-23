require "minitest/autorun"
require_relative "../lib/linear_function"

describe LinearFunction do
  before do
    million             = (1..1_000_000).to_a
    @ten_integers       = million.sample(10)
    @hundred_integers   = million.sample(100)
    @thousand_integers  = million.sample(1000)
    @big_integers       = [Integer::MAX, 0, Integer::MIN, Integer::MAX+1, 12]
    @rand_array         = Array.new(1000) { rand(1_000_000)}
  end

  it "handles nil coming in" do
    assert_equal [Integer::MIN,Integer::MIN,Integer::MIN,Integer::MIN], LinearFunction.max_four(nil)
  end

  it "handles empty array coming in" do
    assert_equal [Integer::MIN,Integer::MIN,Integer::MIN,Integer::MIN], LinearFunction.max_four([])
  end  

  it "an array with less than four integers gets padded with Integer::MIN" do
    assert_equal [3,2,1,Integer::MIN], LinearFunction.max_four([1,2,3])
  end

  it "handles negative numbers as well" do
    assert_equal [3,2,1,-1], LinearFunction.max_four([1,2,3,-1])
  end  

  it "runs for random array" do
    assert_equal @rand_array.max(4), LinearFunction.max_four(@rand_array)
  end

  it "runs for large integers" do
    assert_equal @big_integers.max(4), LinearFunction.max_four(@big_integers)
  end

  it "runs for ten integers" do
    assert_equal @ten_integers.max(4), LinearFunction.max_four(@ten_integers)
  end

  it "runs for one hundred integers" do
    assert_equal @hundred_integers.max(4), LinearFunction.max_four(@hundred_integers)
  end

  it "runs for one thousand integers" do
    assert_equal @thousand_integers.max(4), LinearFunction.max_four(@thousand_integers)
  end
end