require 'minitest/autorun'

load 'autohash.rb'

class TestNil < MiniTest::Test

  def setup
    @a = AutoHash.new(nil) do |elem|
      elem.to_s
    end
    @a << 'Hello'
    @a << 2
    @a << 99.2
  end

  def test_hello
    assert @a.key? 'Hello'
  end

  def test_hello_value
    assert @a.value? 'Hello'
  end
  
  def test_2
    assert @a.key? '2'
  end

  def test_2_not_num
    assert not(@a.key?(2))
  end

  def test_992
    assert @a.key? '99.2'
  end

  def test_992_not_num
    assert not(@a.key? 99.2)
  end
end
