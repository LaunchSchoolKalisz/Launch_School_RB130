=begin
Passing Parameters Part 3

Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

Fill out the following method calls for gather so that they produce the corresponding output shown in 
numbers 1-4 listed below:

1)

gather(items) do | , |
  puts
  puts
end

Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!

2)
gather(items) do | , , |
  puts
  puts
  puts
end

Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!

3)
gather(items) do | , |
  puts
  puts
end

Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!

4)
gather(items) do | , , , |
  puts
end

Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *items, last_item |
  puts items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first_item, *middle_items , last_item |
  puts first_item
  puts middle_items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do | first_item , *other_items |
  puts first_item
  puts other_items.join(", ")
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do | first, second, third, forth |
  puts "#{first}, #{second}, #{third}, and #{forth}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

=begin
LS Solution

# 1
gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

# 2
gather(items) do |apples, *vegetables, wheat|
  puts apples
  puts vegetables.join(', ')
  puts wheat
end

# 3
gather(items) do |apples, *assorted|
  puts apples
  puts assorted.join(', ')
end

# 4
gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
Discussion
This isn't necessarily just an exercise related to blocks, but how Ruby handles passing parameters in 
different situations. We can make equivalent code that gives us the same output, if we make changes to 
gather method for each numbered problem(1-4).

# 1
def gather(*produce, wheat)
  puts "Let's start gathering food."
  p produce
  puts wheat
  puts "We've finished gathering!"
end

# 2
def gather(apples, *vegetables, wheat)
  puts "Let's start gathering food."
  puts apples
  p vegetables
  puts wheat
  puts "We've finished gathering!"
end

# 3
def gather(apples, *assorted)
  puts "Let's start gathering food."
  puts apples
  p assorted
  puts "We've finished gathering!"
end

# 4
def gather(apples, corn, cabbage, wheat)
  puts "Let's start gathering food."
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
  puts "We've finished gathering!"
end

# method call

gather(*items) # notice we need a splat operator for passing in that array now.

The calls for outputting our variables are the same, we can even move the block parameters and make them 
our method parameters. For calling this new gather method, we have to use *items instead of just items as 
an argument. Using *items passes each array element as a list of items instead of a bundled array of items. 
Having to define four different methods though is cumbersome, using a block gives us much more flexibility 
on how we want to group our output.

This has also shown us a key difference between how arrays are passed as parameters either to a block or a 
method. When yielded to a block, an array's individual elements will get converted to a list of items if 
the block parameters call for that conversion(such as when we have parameters like |apples, *assorted|).

When passing an array to a method, we need to be explicit in how we pass it. If we want to change that 
array into a list of items, we'll have to do so with the splat operator *. Overall, it seems like using a 
block was the right way to go, it allows us more flexibility and leaves the implementation of gather 
to the user.
=end
