# Variable Scope

## Types of Variables
When discussing variable scope in Ruby, it is important to first understand the types of variables that we will be working with. This is because the type of variable will affect the scoping rules to be followed. There are 5 types of variables in Ruby: constants, global variables, class variables, instance variables, and local variables. A brief description of each will follow.

Of note, local variables are very commonly used, as they have a narrow scope. Using local variables can help to avoid naming difficulties in a program due to their narrow scope. Rubyists must be cautious when naming and using variables with broader scope, such as constants or global variables. 

### Constants 
Constants should not be changed (although, Ruby does allow them to be changed after giving a warning). They are available throughout the scopes of the program and have a lexical scope. 
```ruby
CONSTANT = "Availability: e v e r y w h e r e"
```

### Global Variables 
Global variables have (surprise!) global scope, meaning that they can be accessed and changed throughout the scopes of the program. Global variables are not commonly used, as unexpected challenges can arise with being able to change a variable anywhere in the program. 
```ruby
$global_var = "Availability: e v e r y w h e r e"
```

### Class Variables
Class variables are available throughout a class and are available to use by instance variables as well as the class itself. However, they must be initialized at the level of the class itself. They can then be changed by class or instance methods. Class variables are shared by all instances of that class.
```ruby
@@confusion_level = 0
```

### Instance Variables 
Instance variables are available during an instance of a class. Therefore, each individual object of the class can have their own personalized instance variables (i.e. 2 members of a dog class can have different instance variables called `@name` with 2 different names assigned to them.)
```ruby
@instance_var = "Availability: During the current instance of the class"
```

### Local variables
Local variables can be accessed and changed locally. This means that the variable, as well as changes made to the variable, are only available within the scope in which it was defined. Local variables can be passed to cross scope boundaries.
```ruby
variable = "Availability: Within the scope I was defined." 
```

Much of this discussion will discuss scope as it relates to local variables, as local variables follow all of the scoping rules, whereas the other variable types do not (as discussed above). What a perfect segue to begin to discuss how scopes are created...

## Creating Scope

In Ruby, variable scope is defined by a *method definition* or a *block*. 

A key to keep in mind when discussing scope in ruby is that an inner scope can access variables initialized in an outer scope, but an outer scope cannot access variables initialized in an inner scope.

### Methods
A method's scope is *self-contained*, meaning it cannot access local variables which were initialized outside of it. When a variable is initialized within the body of the method, it can be referenced or modified from within the body of the method. Variables initialized within the self-contained scope are not available outside of the body of the method. So how can methods access variables? We can initialize them within the body of the method, or we can pass them into the method as parameters.

Let's work with an example to solidify how method definition effects the scope of a local variable:

In the following examples, we would like to give `plant_mom` access to our `plants_info` so we know how much our precious plants need to be watered.

```ruby
plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulent", "low"]]

def plant_mom(plant_info)
  plant, watering_needs = plant_info[0], plant_info[1]
  case watering_needs
  when "low"
    watering_needs = "2"
  when "medium"
    watering_needs = "4"
  when "high"
    watering_needs = "6"
  end

  p plant_info # ==> ["succulent", "low"]
  p plants_info # raises an error! NameError: undefined local variable or method `plants_info' for main:Object
  "We should water the #{plant} #{watering_needs} times this week."
end

plant_mom(plants_info[3])
```

In the example above, we initialize a local variable called `plants_info` on `line 1` and assign it to a nested array. On `lines 3-17` we define a method called `plant_mom` which accepts 1 parameter. By defining a method, we create a self-contained scope, meaning that we can only access variables which are initialized inside of the method body, or variables that are passed into the method. On `line 19` we invoke the method `plant_mom`, and pass in an element of our `plants_info` variable as the parameter. On `line 4` we initialize 2 local variables `plant` and `watering_needs` within the method body, and assign them to the elements from our `plant_info` array. We are able to accesss these elements, as they were passed into the method at invocation on `line 19`. So, on  `line 14`, we are able to print the `plant_info` array from within the method, because it was passed into the method at invocation on `line 19`. However, when we try to access `plants_info` on `line 14` from within the method, we are not able to access it due to the method's self-contained scope. The local variable was initialized outside of the method, and so it is not accessible from within the method when we attempt to access it. If we had attempted to access the variables `plant` or `watering_needs` outside of the method body, we would not be able to access them, either, due to the method's self-contained scope. 

Let's move on to another example:

```ruby
plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulent", "low"]]

def plant_mom(plant_info)
  plant, watering_needs = plant_info[0], plant_info[1]
  case watering_needs
  when "low"
    watering_needs = "2"
  when "medium"
    watering_needs = "4"
  when "high"
    watering_needs = "6"
  end
  "We should water the #{plant} #{watering_needs} times this week."
end

puts plant_mom(plants_info[3]) # => We should water the succulent 2 times this week.
p plants_info # => [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulent", "low"]]
```
In this example, we initialize a local variable `plants_info` on `line 1` and assign it to a nested array. On `lines 3-14` we define a method called `plant_mom` which accepts 1 parameter. By defining a method, we create a self-contained scope, meaning that we can only access variables which are initialized inside of the method body, or variables that are passed into the method. On `line 16` we invoke the method `plant_mom`, and pass in an element of our `plants_info` variable as the parameter. On `line 4` we initialize 2 local variables `plant` and `watering_needs` within the method body, and assign them to the elements from our `plant_info` array, which was passed into the method at invocation. On `lines 5-12` we use a case statement to reassign the local vairbale `watering_needs` based on what `watering needs` was assigned to upon initialization. A case statement does not create a new scope, similar to how a for statement does not create a new scope, as neither are method definitions, nor are they blocks. Method definition should always begin with `def methodname..end`. A way to identify if a `do..end` or `{..}` is a block and therefore creates a scope is to check to see if those terms follow a method invocation. If the statement immediately follows a method invocation, then, it is considered a block and a new scope is created. Continuing with the example, the method returns the string on `line 13`, using the local variables defined on `line 4`, which we see output on `line 14`. On `line 15`, we see that the `plants_info` string remains unchanged due to the initialization of the local variables on `line 4`.   

```ruby
plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulent", "low"]]

def plant_mom(plant_info)
  case plant_info[1]
  when "low"
    plant_info[1] = "2"
  when "medium"
    plant_info[1] = "4"
  when "high"
    plant_info[1] = "6"
  end
  "We should water the #{plant_info[0]} #{plant_info[1]} times this week."
end

puts plant_mom(plants_info[3]) # => We should water the succulent 2 times this week.
p plants_info # => [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulent", "1"]]
```
We have one final example, which should be a direct contrast to the last. In this example, we initialize a local variable `plants_info` on `line 1` and assign it to a nested array. On `lines 3-13` we define a method called `plant_mom` which accepts 1 parameter. By defining a method, we create a self-contained scope, meaning that we can only access variables which are initialized inside of the method body, or variables that are passed into the method. On `line 15` we invoke the method `plant_mom`, and pass in an element of our `plants_info` variable as the parameter. On `lines 4-11` we use a case statement to reassign the element from the `plants_info` array which is passed into the method. Unlike the last example, we have not reassigned the element that was passed in from the array in the relatively outer scope to a local variable in the inner scope. By looking at what is output on `line 16` we can see that by passing the variable from the outer scope into the method, we are able to update the local variable in thr outer scope. After the `plant_mom` method is invoked on `line 15`, the `plants info` array is mutated. 

### Blocks
Blocks are designated by `do..end` or `{}` and they create a new scope for local variables. A variable's scope is determined by where it is initialized. We are able to change variables from an inner scope, and that change can affect the outer scope, so naming variables correctly is important. As stated above in one of the method examples, not all `do..end` or `{..}` statements are considered blocks. A way to identify if a `do..end` or `{..}` is a block and therefore creates a scope is to check to see if it follows a method invocation. If the statement immediately follows a method invocation, then, it is considered a block and a new scope is created.

```ruby
islands = ["The Big Island", "Kauai", "Maui", "Niihau"]

islands.each do |island| 
  adjective = "beautiful" 
  puts "#{island} is the most #{adjective} of all of the Hawaiian Islands."
end

puts adjective
```
On `line 1` we initiate a local variable `islands` which we assign to an array of strings. On `line 3` we invoke the each method on the local variable `islands`. The `do..end` block follows invocation of the `each` method, and therefore creates a new scope, with `island` as a block parameter. We initialize local variable `adjective` on `line 4` in the inner scope of the block. On `line 5` we use both our block parameter `island` and our local variable `adjective` to output a statement. However, on `line 8` when we attempt to output our local variable `adjective`, ruby no longer has access to the variable `adjective` and so it raises a `NameError`. This is because blocks create an inner scope, and so this is a classic case of an outer scope not being able to access variables initialized in an inner scope. Let's see if we can fix this...

```ruby
islands = ["The Big Island", "Kauai", "Maui", "Niihau"]
adjective = "green"

islands.each do |island| 
  adjective = "beautiful" 
  puts "#{island} is the most #{adjective} of all of the Hawaiian Islands."
end

puts adjective
```
This code should run error free. This is because we added a local variable initialization to `line 2`, which is in the relatively outer scope when compared to the inner scope that the block creates on `lines 4-7` by the `do..end` immediately following the `each` method invocation. Therefore, `line 9`, which is also in the relatively outer scope, now has access to the local variable `adjective`. But what will `line 9` output? It outputs `beautiful` because we were able to reassign local variable `adjective` from `line 2`. We did this without passing the variable into the block. This is an important differentiation from method definition. 

```ruby 
island = "Kauai"
count = 0 

while count < 4 do 
  adjective = "beautiful" 
  puts "#{island} is the most #{adjective} of all of the Hawaiian Islands."
  count += 1
end

puts adjective
```
One more example to go through. In this example, we initialize 2 local variables on `lines 1 and 2`. On `line 4`, we use `while`, which is a part of the ruby language, followed by a `do..end` statement. On `line 5` we and initialize a 3rd local variable. However, in this example, there is no method invocation, as `while` is not a method, and so the `do..end` statement does not designate a block and therefore does not create an inner scope. This is demonstrated on `line 10` where we are still able to access local variable `adjective` and the code runs error free. It is important to remember that `do..end` and `{..}` do not automatically define a block and initialize an inner scope. 

In this article, we have discussed variables, variable scope through using local variables, and how variable scope is related to method definitions and method invocations. For a more advanced discussion of scope and how it relates to bindings, please see my next article. 