require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class CashRegister
  attr_reader :total_money

  def initialize(total_money)
    @total_money = total_money
  end

  def change(transaction)
    transaction.amount_paid - transaction.item_cost
  end

  def give_receipt(transaction)
    puts "You've paid $#{transaction.item_cost}."
  end

  def accept_money(transaction)
    @total_money += transaction.amount_paid
  end

  def start_transaction(transaction)
    transaction.prompt_for_payment
    accept_money(transaction)
    change(transaction)
    give_receipt(transaction)
  end
end

class CashRegisterTest < MiniTest::Test
  def setup
  end
end

=begin
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
=end
