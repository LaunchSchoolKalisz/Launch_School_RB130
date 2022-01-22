# Array#each method iterates through the array, yielding each element to the block, where the block can do whatever 
# it needs to do to each element. Then, the method returns the calling object.

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])  # yield to the block, passing in the current element to the block
    counter += 1
  end

  array  # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end
# 1
# 2
# 3
# 4
# 5
# => [1, 2, 3, 4, 5]

# Becuase we return the calling object, we can chain blocks

each([1, 2, 3, 4, 5]) {|num| "Do nothing"}.select { |num| num.odd? }
# => [1, 3, 5]