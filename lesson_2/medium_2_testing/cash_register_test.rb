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
    assert_output("You've paid $#{@transaction.item_cost}.\n") {@register.give_receipt(@transaction)}
  end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
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

LS Solution for test give receipt
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  # Other tests omitted for brevity

  def test_give_receipt
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end
end
Discussion
For this test, we'll be testing that our method outputs a certain message. To test this, we need to use the 
assertion, assert_output. Outputting a message is also considered a side effect, so it is something we 
would want to test. This is especially true since our message should reflect a state of our current 
transaction. assert_output uses a slightly different syntax than something like assert and assert_equal. 
We pass in code that will produce the "actual" output via a block. Then, internally assert_ouput compares 
that output to the expected value passed in as an argument. In this case that expected value is: 
"You've paid $#{item_cost}.\n" Notice that we include a newline character at the end there. Any little 
nuances related to the implementation of our method have to be taken into account. puts appends a 
newline to the message that is output. We must include that newline character in our expected value as 
well when making an assertion with assert_output.

LS Prompt for Prompt for Payment
Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. We've 
changed the transaction class a bit to make testing this a bit easier. The Transaction#prompt_for_payment 
now reads as:

def prompt_for_payment(input: $stdin)
  loop do
    puts "You owe $#{item_cost}.\nHow much are you paying?"
    @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
    break if valid_payment? && sufficient_payment?
    puts 'That is not the correct amount. ' \
         'Please make sure to pay the full cost.'
  end
end

We've added an input keyword parameter that lets the caller provide a different source of input. The default 
value for the parameter is $stdin; if we don't provide the input parameter, Ruby will use $stdin as its 
value.

What is $stdin? It represents the standard input stream, which is usually the keyboard. Specifically, 
$stdin is a global variable that Ruby uses to represent the default source of input. Thus, when we write 
code such as str = gets.chomp, it's equivalent to str = $stdin.gets.chomp.

If we don't need to specify $stdin, then why do we need to use it with this method? Couldn't we just call 
gets.chomp.to_f on line 4 above? We could, if we always wanted to get input from the keyboard. However, 
sometimes we need to get input from elsewhere. In particular, when testing interactive programs, you don't 
want to sit at the keyboard and provide the same inputs over and over. It would be nice if we could "mock" 
the keyboard input - that is, send input to the program in such a way that it can read it without changing 
any code. That's where code like this comes into play. We can call prompt_for_payment with an argument that 
provides the input in a way that is indistinguishable from keyboard input.

In this exercise, we'll need to simulate -- mock -- the user input. Our tests need to be automated, so we 
can't prompt the user with Kernel#gets. One way to do that is to pass a "string stream" to the method as 
the input parameter. Ruby provides a string stream class called StringIO. To use it, all you need to do is 
create a StringIO object that contains all of your simulated keyboard inputs, then pass it to 
prompt_for_payment. For instance:

input = StringIO.new("30\n")
transaction.prompt_for_payment(input: input)

The object assigned to input here is a StringIO object that simulates the keyboard by acting like the user 
type the number 30, then pressed the Return key (\n). Check out how this works with gets:

input = StringIO.new("30\n")
number = input.gets.chomp
puts "The number was #{number}!"   # prints "The number was 30!"

With this technique, running tests for keyboard entry is a breeze. Just sit back and watch things run. 
Writing the tests is a little harder. Once you understand how a StringIO object works, though, and you 
modify your code for the additional flexibility, it's not too hard.

The key to solving this exercise lies with this technique. We'll be testing a method defined in the 
Transaction class. It may be best to include this test in a new test file related to the Transaction class.

LS Solution for Prompt for Payment

require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
  end
end

Discussion
With the description above, this code isn't too difficult to understand. The test first creates a new 
transaction for an item whose cost is $30. We then create a StringIO object that simulates a keyboard entry 
of the number 30 followed by a newline character. Next, we pass the StringIO object to the 
prompt_for_payment method.

Since prompt_for_payment will get its input from the StringIO object, it will act exactly like it would 
have were we using the keyboard directly. In this case, it will set the amount paid to $30 and return. 
Finally, we can assert that the right amount was paid.
=end