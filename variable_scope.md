The first article will discuss the topic of variable scope at the level of RB 109. It should discuss what creates scope and what does not create scope. This article should specifically address scope as it relates to method definition and invocation.
Use codes examples with explanations to support the discussion.

# Variable Scope

## Types of Variables
When discussing variable scope in Ruby, it is important to first understand the types of variables that we will be working with. This is because the type of variable will effect the scoping rules to be followed. There are 5 types of variables in Ruby: constants, global variables, class variables, instance variables, and local variables. 

Of note, local variables are very commonly used, as they have a narrow scope. Using local variables can help to avoid naming difficulties. Rubyists must be cautious when naming and using variables with a more broad scope, such as constants or global variables.

### Constants 
Constants 

### Global Variables 
Global variables have (surprise!) global scope, meaning that they can be accessed and changed from anywhere - (i.e. from inside or outside of a method). Global variables are not commonly used 

### Class Variables
Constants 

### Instance Variables 
Constants 

### Local variables
Local variables can be accessed and changed locally meaning that the variable, as well as changes made to the variable, are only available within the scope in which it was defined.

What a perfect seguay to begin to discuss how scopes are created...

## Creating Scope

## Method Definition, Method Invocation & Scope