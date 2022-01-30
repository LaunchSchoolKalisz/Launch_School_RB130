=begin
Nil Assertions
Write a minitest assertion that will fail if value is not nil.
=end

assert_equal(nil, value)

=begin
LS Solution

assert_nil value

Discussion

#assert_nil tests whether its first argument is nil. You can use:

assert_equal nil, value

instead, but #assert_nil is clearer and issues a better failure message.
=end
