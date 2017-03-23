require "rubygems"
require "test/unit"
require_relative "../../Problem1.rb"

class MultipleTest < Test::Unit::TestCase
  def test_instance
    multiple_obj = Multiple.new([3, 5])
    assert_instance_of Multiple, multiple_obj
  end

  def test_accessor
    multiple_obj = Multiple.new([3, 5],999)
    assert_equal(999,multiple_obj.limit )
    assert_equal([3,5],multiple_obj.numbers )
  end

  def test_result
    multiple = Multiple.new([3,5],999)
    assert_equal(233168,multiple.fetch_valids.inject(&:+))
  end
end

# >> Run options:
# >>
# >> # Running tests:
# >>
# >> ...
# >>
# >> Finished tests in 0.002585s, 1160.5416 tests/s, 1547.3888 assertions/s.
# >>
# >> 3 tests, 4 assertions, 0 failures, 0 errors, 0 skips
# >>
# >> ruby -v: ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
