=begin
Passing Parameters Part 1

Modify the method below so that the display/output of items is moved to a block, and its implementation is 
left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end

=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts "#{yield(items)}"
  puts "Nice selection of food we have gathered!"
end

gather(items) {|items| items.join(', ')}
