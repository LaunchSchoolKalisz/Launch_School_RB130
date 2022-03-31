The first article will discuss the topic of variable scope at the level of RB 109. It should discuss what creates scope and what does not create scope. This article should specifically address scope as it relates to method definition and invocation.
Use codes examples with explanations to support the discussion.

# Variable Scope

## Types of Variables
When discussing variable scope in Ruby, it is important to first understand the types of variables that we will be working with. This is because the type of variable will effect the scoping rules to be followed. There are 5 types of variables in Ruby: constants, global variables, class variables, instance variables, and local variables. A brief discription of each will follow.

Of note, local variables are very commonly used, as they have a narrow scope. Using local variables can help to avoid naming difficulties in a program due to their narrow scope. Rubyists must be cautious when naming and using variables with a more broad scope, such as constants or global variables. 

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
Class variables are available throughout a class, and are available to use by instance variables as well as the class itself. However, they must be initialized at the level of the class itself. They can then be changed by class or instance methods.
```ruby
@@confusion_level = 0
```

### Instance Variables 
Instance variables are available during an instance of a class. 
```ruby
@instance_var = "Availability: "
```

### Local variables
Local variables can be accessed and changed locally. This means that the variable, as well as changes made to the variable, are only available within the scope in which it was defined. Local variables can be passed to cross scope boundaries.
```ruby
variable = "Availability: Within the scope I was defined." 
```

The majority of this discussion will discuss scope as it relates to local variables, as local variables follow all of the scoping rules, wehere as the other variable types do not (as discussed above). What a perfect seguay to begin to discuss how scopes are created...

## Creating Scope

In Ruby, variable scope is defined by a *method definition* or a *block*. 

A key to keep in mind when discussing scope in ruby is that an inner scope can access variables initialized in an outer scope, but an outer scope cannot accss variables initialized in an inner scope.

### Methods
A method's scope is *self-contained*, meaning it cannot access local variables which were intitialized outside of it. When a variable is initialized within the body of the method, it can be referenced or modified from within the body of the method. Variables initialized within the self-contained scope are not availble outside of the body of the method. So how can methods access variables? We can initialize them within the body of the method, or we can pass them into the method as parameters.

Let's work with an example to solidify how method definition effects the scope of a local variable:

In the following examples, we would like to give `plant_mom` access to our `plants_info` so we know how much our precious plants need to be watered.

```ruby
plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "low"]]

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

  p plant_info # ==> ["succulant", "low"]
  p plants_info # raises an error! NameError: undefined local variable or method `plants_info' for main:Object
  "We should water the #{plant} #{watering_needs} times this week."
end

plant_mom(plants_info[3])
```

In the example above, we initialize a local variable called `plants_info` on `line 1` and assign it to a nested array. On `lines 3-17` we define a method called `plant_mom` which accepts 1 parameter. By defining a method, we create a self-contained scope, meaning that we can only access variables which are initialized inside of the method body, or variables that are passed into the method. On `line 19` we invoke the method `plant_mom`, and pass in an element of our `plants_info` variable as the parameter. On `line 4` we initialize 2 local variables `plant` and `watering_needs` within the method body, and assign them to the elements from our `plant_info` array. We are able to accesss these elements, as they were passed into the method at invocation on `line 19`. So, on  `line 14`, we are able to print the `plant_info` array from within the method, because it was passed into the method at invocation on `line 19`. However, when we try to access `plants_info` on `line 14` from within the method, we are not able to access it due to the method's self-contaned scope. The local variable was initialized outside of the method, and so it is not accessible from within the method when we attempt to access it. If we had attempted to access the variables `plant` or `watering_needs` outside of the method body, we would not be able to access them, either, due to the method's self-contained scope. 

Let's move on to another example:

```ruby
plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "low"]]

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

puts plant_mom(plants_info[3]) # => We should water the succulant 2 times this week.
p plants_info # => [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "low"]]
```
In this example, we initialize a local variable `plants_info` on `line 1` and assign it to a nested array. On `lines 3-14` we define a method called `plant_mom` which accepts 1 parameter. By defining a method, we create a self-contained scope, meaning that we can only access variables which are initialized inside of the method body, or variables that are passed into the method. On `line 16` we invoke the method `plant_mom`, and pass in an element of our `plants_info` variable as the parameter. On `line 4` we initialize 2 local variables `plant` and `watering_needs` within the method body, and assign them to the elements from our `plant_info` array, which was passed into the method at invocation. On `lines 5-12` we use a case statement to reassign the local vairbale `watering_needs` based on what `watering needs` was assigned to upon initialization. A case statement does not create a new scope, similar to how a for statement does not create a new scope, as neither are method definitions. A way to identify if a `do..end` or `{..}` is a block and therefore creates a scope is if it follows a method invocation: if they immediately follow a method invocation then, they are considered a block and a new scope is created. Continuing on with the example, the method returns the string on `line 13`, using the local variables defined on `line 4`, which we see output on `line 14`. On `line 15`, we see that the `plants_info` string remains unchanged due to the initialization of the local variables on `line 4`.   

```ruby
plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "low"]]

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

puts plant_mom(plants_info[3]) # => We should water the succulant 2 times this week.
p plants_info # => [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "1"]]
```
We have one final example, which should be a direct contrast to the last. In this example, we initialize a local variable `plants_info` on `line 1` and assign it to a nested array. On `lines 3-13` we define a method called `plant_mom` which accepts 1 parameter. By defining a method, we create a self-contained scope, meaning that we can only access variables which are initialized inside of the method body, or variables that are passed into the method. On `line 15` we invoke the method `plant_mom`, and pass in an element of our `plants_info` variable as the parameter. On `lines 4-11` we use a case statement to reassign the element from the `plants_info` array which is passed into the method. Unlike the last example, we have not reassigned the element that was passed in from the array in the relatively outer scope to a local variable in the inner scope. By looking at what is output on `line 16` we can see that by passing the variable from the outer scope into the method, we are able to update the local variable in thr outer scope. After the `plant_mom` method is invoked on `line 15`, the `plants info` array is mutated. 

### Blocks
Blocks are designated by `do..end` or `{}` and they create a new scope for local variables. A variable's scope is determined by where it is initialized. We are able to change variables from an inner scope, and that change can effect the outer scope, so naming variables correctly is important. 

```ruby
islands = ["Big Island", "Kauai", "Maui", "Nihaau"]

loop do # the do..end block follows invocation of the loop methid, and creates a new scope
end

```

## Method Definition, Method Invocation & Scope