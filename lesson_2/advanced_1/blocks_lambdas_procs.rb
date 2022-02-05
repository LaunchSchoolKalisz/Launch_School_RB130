=begin
Exploring Procs, Lambdas, and Blocks: Definition and Arity

This exercise covers material that you do not have to master. We provide the exercise as a way to explore 
the differences between procs, lambdas, and blocks.

For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and 
implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the 
differences between the two. Run each group of code below: For your answer to this exercise, write down 
your observations for each group of code. After writing out those observations, write one final analysis 
that explains the differences between procs, blocks, and lambdas.
=end

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

=begin 
Outputs:
#<Proc:0x00007fbeeb15aca0 blocks_lambdas_procs.rb:14>
Proc
This is a .
This is a cat.

This demonstrates that a proc has lenient arity - we dont need to define the number of arguments, procs
are flexible with the number of arguments that they can take
=end

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
Outputs:
#<Proc:0x00007fa83c172118 blocks_lambdas_procs.rb:33 (lambda)>
#<Proc:0x00007fa83c1720c8 blocks_lambdas_procs.rb:34 (lambda)>
Proc
This is a dog.
blocks_lambdas_procs.rb:33:in `block in <main>': wrong number of arguments (given 0, expected 1) (ArgumentError)
        from blocks_lambdas_procs.rb:39:in `<main>'

This demonstrates that a lambda is a type of proc, but one that is not lenient with its arity. We must
provide it with the number of arguments that are defined, or else it throws an error
=end

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

=begin
Output:
  This is a .
  blocks_lambdas_procs.rb:57:in `block_method_1': no block given (yield) (LocalJumpError)
        from blocks_lambdas_procs.rb:61:in `<main>'
  
This demonstrates that blocks, like lambdas, do not have flexible arity when it comes to blocks
=end

# Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

=begin
Output:
This is a turtle.
This is a turtle and a .
blocks_lambdas_procs.rb:81:in `block in <main>': undefined local variable or method `animal' for main:Object (NameError)
        from blocks_lambdas_procs.rb:74:in `block_method_2'
        from blocks_lambdas_procs.rb:81:in `<main>'

This demonstrates that an error will be thrown if we try to access a variable outside of the scope
=end

=begin
LS Solution
=end
