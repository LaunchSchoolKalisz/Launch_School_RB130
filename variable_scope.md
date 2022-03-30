The first article will discuss the topic of variable scope at the level of RB 109. It should discuss what creates scope and what does not create scope. This article should specifically address scope as it relates to method definition and invocation.
Use codes examples with explanations to support the discussion.

# Variable Scope

## Types of Variables
When discussing variable scope in Ruby, it is important to first understand the types of variables that we will be working with. This is because the type of variable will effect the scoping rules to be followed. There are 5 types of variables in Ruby: constants, global variables, class variables, instance variables, and local variables. A brief discription of each will follow.

Of note, local variables are very commonly used, as they have a narrow scope. Using local variables can help to avoid naming difficulties in a program due to their narrow scope. Rubyists must be cautious when naming and using variables with a more broad scope, such as constants or global variables.

### Constants 
Constants should not be changed (although, Ruby does allow them to be changed after giving a warning). They are available throughout the scopes of the program. 
```ruby
CONSTANT = "Availability: e v e r y w h e r e"
```

### Global Variables 
Global variables have (surprise!) global scope, meaning that they can be accessed and changed throughout the scopes of the program. Global variables are not commonly used, as unexpected challenges can arise. 
```ruby
$global_var = "Availability: e v e r y w h e r e"
```

### Class Variables
Class variables become a bit more complex. They are available throughout a class, and are available to use by instance variables as well as the class itself. However, they must be initialized at the level of the class itself. They can then be changed by class or instance methods.
```ruby
@@confusion_level = 0
```

### Instance Variables 
Instance variables are available during an instance of a class. 
```ruby
@confusion_level = "Availability: "
```

### Local variables
Local variables can be accessed and changed locally. This means that the variable, as well as changes made to the variable, are only available within the scope in which it was defined. Local variables can be passed to cross scope boundaries.
```ruby
variable = "Availability: Within the scope I was defined." 
```

What a perfect seguay to begin to discuss how scopes are created...

## Creating Scope

In Ruby, variable scope is defined by a *method definition* or a *block*. 



## Method Definition, Method Invocation & Scope