=begin
Write a method that takes an optional block. If the block is specified, the method should execute it, and 
return the value returned by the block. If no block is specified, the method should simply return the 
String 'Does not compute.'.

Examples:

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'
=end

def compute
  if block_given?
    yield 
  else
    "Does not compute."
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

=begin
LS Solution
Solution

def compute
  return 'Does not compute.' unless block_given?
  yield
end

Discussion
The Kernel#block_given? method can be used to determine if a block has been passed to a method, even if 
there is no mention of a block in the method arguments. We use it here to detect when we should return 
'Does not compute.', and when we should return the value yielded by the block.

Further Exploration
Modify the compute method so it takes a single argument and yields that argument to the block. Provide at 
least 3 examples of calling this new version of compute, including a no-block call.
=end
