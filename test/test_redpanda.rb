require 'minitest/autorun'

load 'autohash.rb'

class RedPanda
    attr_reader :name

    def initialize name
        @name = name
    end
end

class TestRedPanda < MiniTest::Test

  def setup
    @a = AutoHash.new(RedPanda) do |elem|
      elem.name
    end
    @a << RedPanda.new('红红')
  end

  def test_红红
    assert @a.key? '红红'
  end

end