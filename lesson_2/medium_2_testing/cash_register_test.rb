require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(15)
    @transaction.amount_paid = 20
  end

  def test_accept_money
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money
    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    assert_equal(5, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $15.\n") {@register.give_receipt(@transaction)}
  end
end

=begin
LS Solution for setup
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
end

Discussion
Here's what we need to set up our test class for CashRegister. First, we need to require all necessary 
libraries and files. "minitest/autorun" is first on the list, as this is the library that will give us 
access to certain parts of the minitest framework that we need. We also need to require the class we want 
to test and any classes it depends on. In this case, we want to test CashRegister, but that class depends 
on collaboration with the Transaction class. We've put those two classes in their own separate files, so 
two relative requires are necessary to gain access to both classes. Finally, we have to set up the correct 
testing class. By minitest convention, we'll be naming this class "Class name we want to test"Test: this 
ends up being, CashRegisterTest. We also have to make sure that our test class subclasses from 
Minitest::Test. This is a very important step, since if we didn't include this inheritance, then this would 
be a plain Ruby class and not a test class.

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

LS Solution for accept money test

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end
end

Discussion
When you first consider this test, it may seem really simple to write. Yet, there is quite a bit of 
groundwork to lay here. First, we need to create some objects to test the #accept_money method. 
#accept_money is a method from class CashRegister, so we'll need an instance of that class. We also need an 
instance of class Transaction. The method #accept_money takes a Transaction object as an argument.

Once we have our objects, we then set the amount_paid via the attr_accessor in the Transaction class. This 
is the value we'll be checking. If our method does work as intended, then when we process a transaction, 
the amount in register should increase exactly by the amount paid.

We test this value by setting variables that represent the money in the register before and after a 
transaction takes place. Finally, we implement the approach/algorithm for this exercise with our 
assertion: assert_equal previous_amount + 20, current_amount. This assertion does indeed pass, and we have 
finished testing our accept money method.

LS Solution for test Change

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

# Other tests omitted for brevity

class CashRegisterTest < Minitest::Test
  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(30)
    transaction.amount_paid = 40

    assert_equal 10, register.change(transaction)
  end
end

Discussion
For this test we set up our initial objects, one CashRegister object and one Transaction object. We also 
make sure to set the amount paid. Recall, that in the last exercise we set it up so that the amount paid 
and the transaction cost were the same.
In this case, we instead pay 40 dollars for a 30 dollar item. Hopefully we'll be getting some money back! 
We test the actual functionality of our CashRegister#change method with the assertion: assert_equal 10, 
register.change(transaction).
We're expecting our change method to give back 10. After running the test it seems to do just that.
=end