=begin
Internal vs External Iterators

This exercise covers material that you do not have to master. We provide the exercise as a way to 
demonstrate how Enumerator objects work.

Thus far, we've used iterators often. You've seen the use of #each and #map used on various data structures, 
such as Arrays and Hashes. These methods make writing certain code a bit easier, at least when compared to a 
while or for loop. Yet, what we've seen thus far is only part of what is available.

Whenever we use map or each on something like an Array, we're using something called "Internal Iteration". 
It's called that because the process and implementation of that iteration is hidden from us, and the process 
that allows us to progress through a collection is part of that hidden implementation.

There's also "External Iteration". This is iteration that takes place at the behest of the user. Ruby gives 
us the option to use this type of iteration with the Enumerator class. For this exercise, lets take a bit 
of a tour of the capabilities of Enumerator. While we do that, let's make something interesting with it.

In this exercise, your task is to create a new Enumerator object. When creating a new Enumerator, you may 
define what values are iterated upon. We'll want to create an Enumerator that can iterate over an infinite 
list of factorials. Once you make this new Enumerator, test it out by printing out the first 7 factorial 
values, starting with zero factorial.

More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, 
see what happens if you print 3 more factorials (the results won't be correct). Now, reset your Enumerator 
(use the rewind method). Finally, print 7 more factorials.

You can find almost everything you need for this exercise in the documentation for Enumerator. In 
particular, check out the ::new method; it should prove a good starting point for this exercise. Some 
further details about internal vs external iterators are mentioned at the start of that documentation, so 
make sure to read that section. That section is a bit dense at places; if you don't understand everything 
about it, that's ok.

A factorial is a mathematical operation that involves multiplying a bunch of sequential positive numbers 
together. They are usually written as a non-negative integer followed by an exclamation point, e.g., 4!. 
The values look like this:

n	n!	notes
0	1	By definition, 0! is 1
1	1	By definition, 1! is 1
2	2	2! = 2 * 1
3	6	3! = 3 * 2 * 1
4	24	4! = 4 * 3 * 2 * 1
5	120	5! = 5 * 4 * 3 * 2 * 1

The factorial values (0!, 1!, 2!, etc.) follow a simple pattern. First, 0! and 1! are both defined to be 1. 
All subsequent factorials are the result of multiplying all the integers from 1 up to the n value together. 
Thus, 5! is 5 * 4 * 3 * 2 * 1, or 120.

The wikipedia page on factorials may also be of some use.

Two final hints:

You'll only need 3 Enumerator methods to complete this exercise.
An Enumerator also implements the Enumerable module. Keep this in mind, as it may make certain parts of this 
exercise easier to write.
=end

# array = [1, 2, 3, 4, 5, 6, 7]
# num = array.size
# enumerator = array.each

# enumerator.each_with_index do |element, idx|
#   result = 1
# end

factorial = Enumerator.new do |to_yield|
  result = 1
  number = 0
  loop do 
    result = number.zero? ? 1 : result * number
    to_yield << result
    number += 1
  end
end

6.times {|number| puts "#{number}! == #{factorial.next}"}
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end

=begin
LS Solution

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

# External iterators

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
Output:

Copy Code
0! == 1         # Output of first times loop
1! == 1
2! == 2
3! == 6
4! == 24
5! == 120
==========================
0! == 720       # Output of 2nd times loop: note the incorrect output
1! == 5040
2! == 40320
3! == 362880
4! == 3628800
5! == 39916800
==========================
0! == 1         # Output of 3rd times loop: this time output is correct
1! == 1
2! == 2
3! == 6
4! == 24
5! == 120
==========================
0! == 1         # Output of each_with_index
1! == 1
2! == 2
3! == 6
4! == 24
5! == 120

Discussion
Most of the work for solving this problem relates to creating our new Enumerator object. We can get a good 
start at understanding how to do this by referencing the Enumerator::new method. It shows how to define a 
new Enumerator that iterates over Fibonacci numbers. We'll start with that as a template, and alter it to 
iterate over factorials instead. For iterating over factorials, we'll need two variables: one to track 
which number factorial we are on, and another store the cumulative value of all prior factorials. We use 
accumulator for the latter, and we use number for the former.

When defining an external iterator, we set the next value in the iteration by calling yielder << value. In 
this case, we use accumulator for value; it sets the current factorial value.

To use our Enumerator object as an internal and external iterator, we utilize two different groups of code. 
First, we have 3 calls to the Intger#times method; this code uses an external iterator (factorial.next). 
Lastly, we have an #each_with_index loop; this code uses an internal iterator.

There is some curious behavior with the external iterators -- the Enumerator doesn't know when to quit. On 
the first call to #times, everything works as expected. However, in the second, things seem to have gotten 
out of hand. The call to #times is not printing the desired values.

The problem here is that the Enumerator doesn't know when we're done iterating when we using an external 
iterator. That's something internal iterators do. However, with external iterators, we need to explicitly 
tell the Enumerator when we're done. We do that by calling the Enumerator#rewind method, which we do on 
line 15. Note that #rewind doesn't tell the Enumerator when to stop iterating; it really tells the 
Enumerator that it's time to begin a new iteration.

Once we call #rewind, the 3rd invocation of times again produces the correct results.

Next, we move on to our #each_with_index call. #each_with_index is designed to work with Enumerator objects, 
so it uses an internal iterator. In particular, #each_with_index knows that it needs to call #rewind each 
time you invoke it. Therefore, when we invoke #each_with_index here, it automatically calls #rewind, and 
outputs the desired results.

Note that we need to explicitly break out of this loop; the factorial method doesn't have a natural stopping 
point, but will keep going for as long as you let it.
=end
