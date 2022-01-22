=begin
Reduce sets the accumulator to the return value of the block, and then passes the accumulator to the 
block on the next yield. Your reduce should take at least 1 argument that represents the array we'll 
operate on. It should also take an optional second argument that represents the default value for the 
accumulator.
=end

def reduce(array, accumulator = 0)
  array.each do |num|
    accumulator = yield(accumulator, num)
  end
  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

=begin
LS Solution

def reduce(array, default=0)
  counter = 0
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

Note that we used a while loop here, but since we are expecting an Array object as the parameter, we 
could have as well used the Array#each to iterate.
=end