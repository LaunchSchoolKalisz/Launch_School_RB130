=begin
Note that the Array#select method takes a block, then yields each element to the block. If the block 
evaluates to true, the current element will be included in the returned array. If the block evaluates 
to false, the current element will not be included in the returned array.
=end

def select(array)
  return_ary = []
  counter = 0

  while counter < array.size
    return_ary << array[counter] if yield(array[counter])
    counter += 1
  end

  return_ary
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      
p select(array) { |num| puts num }      
p select(array) { |num| num + 1 }

=begin
LS Solution

def select(array)
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    result << current_element if yield(current_element)
    counter += 1
  end

  result
end

Note that we used a while loop here, but since we're expecting an Array object as the parameter, 
we could have as well used the Array#each to iterate.
=end