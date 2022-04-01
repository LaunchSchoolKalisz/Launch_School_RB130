# Binding in Ruby

In this article, we will discuss binding and how it affects scope. If you would like a refresher on variable scope before tackling a more advanced topic, please see my previous article [here](./variable_scope.md). Before we can dive into binding, we must first understand closures, so a brief introduction to closures first. 

A closure is a general programming concept, which exists across languages. It refers to a "chunk of code" that can be saved, and executed later, possibly from a different location. Closures work by *binding* their _surrounding artifacts_, which can include variables, methods, or other pieces of data. Binding is the relationship that closures share with the surrounding artifacts (methods, variables, constants) of its scope upon being defined. Closures can access and/or update surrounding artifacts regardless of when or where the closure is called upon later. Binding creates an enclosure around all the artifacts (variables, methods, constants) based on the scope when the closure is defined, so that they can be referenced when the closure is executed. 

Within Ruby, Blocks, Proc objects and Lambda's are all closures. It may be helpful to note that a Proc is an object instantiated from the `Proc` class, a lambda is a special kind of `Proc` object, and a block is not an object. This is important to recognize, because a block is not an object, so it is not a value that we can return. However, a `Proc` is an object and it is also a closure. That means we can assign closures to variables and pass them around in the form of a Proc or Lambda. It also means that we can return them from either a method or a block. It is important to recognize that closures can be returned from and passed to other methods because this gives us access to data that would otherwise be out of scope. This also allows us to pass along functionality. This allows for DRY and flexible code. It is also important to remember that closures returned from method and blocks that are defined within the methods and/or blocks will have access to the artifacts within the scope of those methods and/or blocks, through binding, which allows the returned closure to reference and/or alter those artifacts later.

An example of binding with a Proc:

```ruby
def give_info(element)
  puts element.call 
end

number = '123-456-7891'
my_proc = proc { number }

give_info(my_proc)
# => 123-456-7891
```

In this example, we define a method `give_info` on `lines 1-3` with 1 parameter. We initialize a local variable `number` on `line 4`, which is out of scope for the `give_info` method. On `line 5` we define a Proc object and assign it to local variable `my_proc` so that we can pass it around later. By defining a Proc object, we create a closure, which creates a binding around all of the objects within its scope. In this case the local variable `number` and the method `give_info` are in scope for the Proc at that time and are part of its binding. Therefore, when we invoke the `give_info` method on `line 7` and pass in our proc as its argument, the `give_info` method has access to the local variable `number` through `my_proc`.  This example shows us that a closure (the proc) is bound to the local variable `number` and is able access it even if it is called upon within a method, where local variable are normally not accessible unless explicitly passed in as an argument upon method invocation. 

For local variables to be a part of a closures binding, **they must be initialized before the closure is created** unless they are explicitly passed into the closure. For example:

```ruby
def give_info(element)
  puts element.call 
end

my_proc = proc { number }
number = '123-456-7891'
give_info(my_proc)
# Raises NameError: undefined local variable or method `number`
```

The above code raises an error because the local variable `number` is initialized after the closure is created and therefore is not in scope at the time that the closure is created. However, if we initialize a local variable before creating a closure, access it within the closure, and then reassign that local variable, the last assigned value will be reflected when the closure is executed:

```ruby
def give_info(element)
  puts element.call 
end

number = '123-456-7891'
my_proc = proc { number }
number = '847-123-4567'

give_info(my_proc)
# => 847-123-4567
```

In this example, the `Proc` referenced by `my_proc` is aware that a new value has been assigned to `number`, even though the reassignment occurs after the `Proc` is created.

An example of binding with a Block:
```ruby
arr = ['a', 'b', 'c']

def foo(array)
  array.map do |el|
    yield(el)
  end
end

foo(arr) do |value|
  value << "a"
end

p arr # ==> ["aa", "ba", "ca"]

hsh = { a: 3, b: 2, c: 5 }

def bar(qux)
  qux  += 2
end
```

Above, you can see how a closure (in this case, a block) binds surrounding local variables and references them during execution. We begin by defining a local variable `arr` on `line 1` and assigning it to an array. We define a method `foo` on `lines 3-7`, and we invoke that method on `line 9` with a block. The block itself directly follows the method invocation, beginning with the `do` keyword and containing all the code up until the `end` keyword. Within our block implementation, we have access to the local variable `arr`, which was initialized on `line 1`. This is because blocks have access to variables initialized in outer scope. The closure created by the block can retain a memory of this variable and its value via a binding. We invoke this block from within the `foo` method with the `yield` statement on `line 3`. The code within the block mutates the array. Therefore, when we output the `arr` array on `line 13`, we will see the updated value `["aa", "ba", "ca"]`.

Local variables must be defined prior to the creation of a closure to be included in its binding, therefore `arr` which is initialized on `line 1` is a part of the binding that is created when we create the closure on `lines 9-11`. In addition, the `foo` method itself is also part of the binding.

This article may be confusing if the reader does not have a strong grasp on variable scope, as well as variable scope as it relates to method definitions, method invocations, and blocks. For a refresher, please see my article on [variable scope](./variable_scope.md).