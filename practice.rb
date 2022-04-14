=begin

# Problem
Create a method with 2 args: string, +int
Print string int times
- int can only be positive
- any chars in the string... case sensitive?

# Examples
repeat('Hello', 3) ==> Hello Hello Hello

# Data
- string, integers, array?

# Algo
- Create a method which accepts 2 parameters
- Print the string, integer times

# Code
=end

vehicles = ['car', 'car', 'truck']

def count_occurences(vehicles)
  results = {}
  vehicles.each do |vehicle|
    if results.include?(vehicle)
      results[vehicle] += 1
    else
      results[vehicle] = 1
    end
  end
  p results 
end

count_occurences(vehicles)
