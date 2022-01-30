=begin
Kind Assertions

Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's 
subclasses (e.g., Integer, Float, etc).
=end

assert_kind_of(Numeric, value)

=begin
LS Solution

assert_kind_of Numeric, value

Discussion
#assert_kind_of uses Object#kind_of? to check if the class of its second argument is an instance of the
named class or one of the named class's subclasses.
=end
