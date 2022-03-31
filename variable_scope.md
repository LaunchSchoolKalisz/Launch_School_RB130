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

```ruby
plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "low"]]

def plant_mom(plant_info)
  plant, watering_needs = plant_info[0], plant_info[1]
  case watering_needs
  when "low"
    watering_needs = "1"
  when "medium"
    watering_needs = "3"
  when "high"
    watering_needs = "5"
  end

  p plant_info # ==> ["succulant", "low"]
  p plants_info # raises an error! NameError undefined local variable or method `plants_info' for main:Object
  "We should water the #{plant} #{watering_needs} times this week."
end

puts plant_mom(plants_info[3])
```

In the example above, we initialize a local variable called `plants_info` on `line 1` to a nested array. On `lines 55-66` we define a method called `plant_mom` which accepts 1 parameter. By defining a method, we create a self-contained scope, meaning that we can only access variables which are initialized inside of the method body, or variables that are passed into the method. We want to give `plant_mom` access to our `plants_info` so we know how much our precious plants need to be watered. 


```ruby
plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "low"]]

def plant_mom(plant_info)
  plant, watering_needs = plant_info[0], plant_info[1]
  case watering_needs
  when "low"
    watering_needs = "1"
  when "medium"
    watering_needs = "3"
  when "high"
    watering_needs = "5"
  end
  "We should water the #{plant} #{watering_needs} times this week."
end

puts plant_mom(plants_info[3]) # => We should water the succulant 1 times this week.
p plants_info # => [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "low"]]
```

```ruby
plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "low"]]

def plant_mom(plant_info)
  case plant_info[1]
  when "low"
    plant_info[1] = "1"
  when "medium"
    plant_info[1] = "3"
  when "high"
    plant_info[1] = "5"
  end
  "We should water the #{plant_info[0]} #{plant_info[1]} times this week."
end

puts plant_mom(plants_info[3]) # => We should water the succulant 1 times this week.
p plants_info # => [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "1"]]
```

### Blocks
Blocks are designated by `do..end` or `{}` and they create a new scope for local variables. A variable's scope is determined by where it is initialized. We are able to change variables from an inner scope, and that change can effect the outer scope, so naming variables correctly is important. 

```ruby
islands = ["Big Island", "Kauai", "Maui", "Nihaau"]

loop do # the do..end block follows invocation of the loop methid, and creates a new scope
end

```

## Method Definition, Method Invocation & Scope