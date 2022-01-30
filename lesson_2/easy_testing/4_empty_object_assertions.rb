=begin
Empty Object Assertions

Write a minitest assertion that will fail if the Array list is not empty.
=end

assert_empty(array)

=begin
LS Solution

assert_empty list

Discussion

#assert_empty tests whether its first argument responds to the method #empty? with a true value. 
You can use:

assert_equal true, list.empty?

instead, but #assert_empty is clearer and issues a better failure message.
=end
