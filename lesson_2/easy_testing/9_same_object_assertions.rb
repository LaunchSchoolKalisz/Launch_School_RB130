=begin
Same Object Assertions

Write a test that will fail if list and the return value of list.process are different objects.
=end

assert_match(list, list.process)

=begin
LS Solution

assert_same list, list.process

Discussion
#assert_same tests whether its first and second arguments are the same object, as determined by #equal?.
=end
