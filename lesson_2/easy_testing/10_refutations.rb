=begin
Refutations

Write a test that will fail if 'xyz' is one of the elements in the Array list:
=end

refute_includes list, 'xyz'

=begin

refute_includes list, 'xyz'

Discussion
Most minitest assertions have a corresponding refutation method that fails if the indicated condition is 
true: refute_equal is the opposite of assert_equal, refute_kind_of is the opposite of assert_kind_of, etc. 
Thus, the refutation of assert_includes is refute_includes.
=end
