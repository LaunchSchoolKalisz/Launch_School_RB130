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

=begin
LS Solution

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

Discussion
This problem boils down to finding the missing integers between each pair of numbers in the original array. 
So, in the first example, we need all the integers between -3 and -2, then between -2 and 1, and finally, 
between 1 and 5.

Enumerable#each_cons is extremely handy when you need to iterate through consecutive, overlapping sequences. 
(Enumerable#each_slice, by contrast, iterates through consecutive, non-overlapping sequences.) Given the 
argument n, it takes every n consecutive elements from the subject collection, and iterates through each 
sequence of n consecutive items.

We use each_cons here for just such an operation, taking 2-number sequences from array. The block simply 
generates the list of numbers between each pair of numbers, and appends them to the result array.

Further Exploration
Can you find other ways to solve this problem? What methods might prove useful? Can you find a way to solve 
this without using a method that requires a block?
=end
