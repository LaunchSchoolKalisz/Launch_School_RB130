=begin
Find Missing Numbers
Write a method that takes a sorted array of integers as an argument, and returns an array that includes all 
of the missing integers (in order) between the first and last elements of the argument.

Examples:

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

# Problem: Create a method which accepts 1 argument. Return an array with missing integers between first
and last integers
=end

def missing(missing_array)
  full_array = (missing_array[0]..missing_array[-1]).to_a
  return_array = full_array - missing_array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
