# Ginni's 

def a_method(&block)
  puts yield
  puts block.call
  puts yield.class
end
  
 this_is_a_proc = proc {'is this a proc?'}
  
 a_method(&this_is_a_proc)
   
=begin
 When working with explicit blocks, the & converts the block to a simple Proc object that can then be referenced inside the method.
 Depending on the method implementation, the parameter is either a block or a proc object. It becomes a proc object when a proc method is invoked on it 
 otherwise it will stay as whatever the block returns 
=end 
 
 
 
  def a_method(a, &block) # to proc
    puts a.call
    block.call
 end
  
 this_is_a_proc = proc {'is thisoc?'}
  
 a_method(this_is_a_proc) {'is this a proc?'} #to block