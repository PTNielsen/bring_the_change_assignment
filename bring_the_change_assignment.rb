require "pry"
require "minitest/autorun"

class Register
  def initialize amount
    @amount = (amount * 100).to_i
    @quarter = 25
    @dime = 10
    @nickel = 5
    @penny = 1
  end

  def change
     @number_of_quarters = @amount / @quarter
     @after_quarter = @amount.%(@quarter)
     @number_of_dimes = @after_quarter / @dime
     @after_dimes = @after_quarter.%(@dime)
     @number_of_nickels = @after_dimes / @nickel
     @after_nickel = @after_dimes.%(@nickel)
     @number_of_pennies = @after_nickel / @penny
     change = [@number_of_quarters,@number_of_dimes,@number_of_nickels,@number_of_pennies]
  end
end

binding.pry

class RegisterTest < Minitest::Test
  def test_change_1
    r = Register.new(0.99)
    assert_equal [3,2,0,4], r.change
  end

  def test_change_2
    r = Register.new(0.42)
    assert_equal [1,1,1,2], r.change
  end

  def test_change_3
    r = Register.new(0.67)
    assert_equal [2,1,1,2], r.change
  end

  def test_change_4
    r = Register.new(0.32)
    assert_equal [1,0,1,2], r.change
  end
end