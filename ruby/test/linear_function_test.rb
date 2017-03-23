require "minitest/autorun"
require_relative "../lib/linear_function"

class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

describe LinearFunction do
  before do
    million             = (1..1_000_000).to_a
    @ten_integers       = million.sample(10)
    @hundred_integers   = million.sample(100)
    @thousand_integers  = million.sample(1000)
    @big_integers       = [Integer::MAX, 0, Integer::MIN, Integer::MAX+1, 12]
  end

  it "handles nil coming in" do
    assert_equal [0,0,0,0], LinearFunction.max_four(nil)
  end

  it "handles empty array coming in" do
    assert_equal [0,0,0,0], LinearFunction.max_four([])
  end  

  it "tests that an array with less than four integers gets padded" do
    assert_equal [3,2,1,0], LinearFunction.max_four([1,2,3])
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