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