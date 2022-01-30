=begin
Same Object Assertions

Write a test that will fail if list and the return value of list.process are different objects.
=end

assert_match(list, list.process)
