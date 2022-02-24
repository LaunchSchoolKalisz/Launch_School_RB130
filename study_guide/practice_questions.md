# RB139 Assessment Practice Questions

## Blocks

1. What are closures?
2. What are blocks?
3. What are Procs and lambdas? How are they different?
4. How do closures interact with variable scope?
5. What are blocks used for? Give examples of specific use cases (2 reasons?)
6. How do we write methods that take a block? What erros and pitfalls can arise from this and how do we avoid them?
7. How do we utilize the return value of a block? How can methods that take a block pass pieces of data to that block?
8. What is `Symbol#to_proc` and how is it used?
9. How do we specify a block argument explicitly?
10. How can we return a `Proc` from a method or block?
11. What is arity? What kinds of things in Ruby exhibit arity? Give explicit examples.
    - blocks
    - procs
    - methods
    - lambdas
12. What is binding?
13. How does binding affect the scope of closures?
14. How do blocks work?
15. How do methods access both implicit and explicit blocks passed in?
16. What is `yield` in Ruby and how does it work?
17. How do we check if a block is passed into a method?
18. Why is it important to know that methods and blocks can return closures?
19. What are the benifits of explicit blocks?
20. What other differences are there between lambdas and procs? (might not be assessed on this, but good to know)
21. What does `&` do when in a the method parameter?

```ruby
def method(&var); end
```

22. What does `&` do when in a method invocation argument?
```ruby
method(&var)
```

23. What is happening in the code below?
```ruby
arr = [1, 2, 3, 4, 5]
p arr.map(&:to_s) # specifically `&:to_s`
```

24. How do we get the desired output without altering the method or the method invocations?
```ruby
def call_this
  yield(2)
end
# your code here
p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"
```

25. How do we invoke an explicit block passed into a method using `&`? Provide example.

26. What concept does the following code demonstrate?

```ruby
def time_it
  time_before = Time.now
  yield
  time_after= Time.now
  puts "It took #{time_after - time_before} seconds."
end
```

27. What will be outputted from the method invocation `block_method('turtle')` below? Why does/doesn't it raise an error?

```ruby
def block_method(animal)
  yield(animal)
end
block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
```

28. What will be outputted if we add the follow code to the code above? Why?

```ruby
block_method('turtle') { puts "This is a #{animal}."}
```

29. What will the method call `call_me` output? Why?

```ruby
def call_me(some_code)
  some_code.call
end
name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"
call_me(chunk_of_code)
```

30. What happens when we change the code as such:

```ruby
def call_me(some_code)
  some_code.call
end
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"
call_me(chunk_of_code)
```

31. What will the method call `call_me` output? Why?

```ruby
def call_me(some_code)
  some_code.call
end
name = "Robert"
def name
  "Joe"
end
chunk_of_code = Proc.new {puts "hi #{name}"}
call_me(chunk_of_code)
```

32. Why does the following raise an error?

```ruby
def a_method(pro)
  pro.call
end
a = 'friend'
a_method(&a)
```

33. Why does the following code raise an error?

```ruby
def some_method(block)
  block_given?
end
bl = { puts "hi" }
p some_method(bl)
```

34. Why does the following code output `false`?

```ruby
def some_method(block)
  block_given?
end
bloc = proc { puts "hi" }
p some_method(bloc)
```

35. How do we fix the following code so the output is `true`? Explain

```ruby
def some_method(block)
  block_given? # we want this to return `true`
end
bloc = proc { puts "hi" } # do not alter this code
p some_method(bloc)
```

36. How does `Kernel#block_given?` work?

37. Why do we get a `LocalJumpError` when executing the below code? &
How do we fix it so the output is `hi`? (2 possible ways)

```ruby
def some(block)
  yield
end
bloc = proc { p "hi" } # do not alter
some(bloc)
```

38. What does the following code tell us about lambda's? (probably not assessed on this but good to know)

```ruby
bloc = lambda { p "hi" }
bloc.class # => Proc
bloc.lambda? # => true
new_lam = Lambda.new { p "hi, lambda!" } # => NameError: uninitialized constant Lambda
```

39. What does the following code tell us about explicitly returning from proc's and lambda's? (once again probably not assessed on this, but good to know ;)

```ruby
def lambda_return
  puts "Before lambda call."
  lambda {return}.call
  puts "After lambda call."
end
def proc_return
  puts "Before proc call."
  proc {return}.call
  puts "After proc call."
end
lambda_return #=> "Before lambda call."
              #=> "After lambda call."
proc_return #=> "Before proc call."
```

40. What will `#p` output below? Why is this the case and what is this code demonstrating?
```ruby
def retained_array
  arr = []
  Proc.new do |el|
    arr << el
    arr
  end
end
arr = retained_array
arr.call('one')
arr.call('two')
p arr.call('three')
```

## Testing

1. What is Minitest? How do we get access to it?
2. What are the different styles of Minitest?
3. What is RSpec? How does it differ from Minitest?
4. What is a test suite? What is a test?
5. What are assertions? How do they work?
6. Give some examples of common assertions and how they are used.
7. What is the SEAT approach? Benefits?
8. What is code coverage and how is it used? What tools can you use to gauge code coverage for yourself?
9. What do testing framworks provide?
10. What is Domain Specific Language (DSL)?
11. What is the difference of assertion vs refutation methods?
12. How does assert_equal compare its arguments?
13. When does setup and tear down happen when testing?
14. What is code coverage?
15. What is regression testing?

## Core Ruby Tools

1. What are RubyGems? How are they used? Where can you find them? How do you manage them in your own environment? How do you include them in projects you create?
2. What is the RubyGems format for projects?
3. What are Ruby Version Managers? Why do we need them? Give some exampled of available Ruby Version Managers and what they can do for you.
4. What is Bundler? What does it do and why is it useful?
5. What is Rake? What does it do and why is it useful?
6. What is a `.gemspec` file?
7. How do the Ruby tools relate to one another?
8. What are the purposes of core tools?
9. What are Version Managers and why are they useful?
10. What constitues a Ruby project?

## Regex

1. What are patterns?
2. How do you define a regex?
3. What is concatenation in regex? How is it achieved?
4. What is alternation in regex? How is it achieved?
5. What are a few examples of the most basic kind of regex patterns?
6. What is a meta-character? How do you deal with them in regex? List a few exampled.
7. What is a character class? How are they created? Give specific examples.
8. How are meta-characters different inside and outside of a character class?
9. What is an anchor? What, specifically, do you have to watch out for with anchors when it comes to Ruby regex?
10. What is a quantifier? How do they operate? Give explicit examples.
11. What is a capture group and how is it used?
12. How do you test a string against a regex?
13. How can you split strings into multiple items with a regex?
14. How do you construct new strings from existing strings?