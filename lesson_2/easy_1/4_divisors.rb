=begin
Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. 
The return value can be in any sequence you wish.

Examples

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# Problem
- Create a method which takes 1 argument
- Returns an array with everything which devides equally
=end

def divisors(num)
  results = []
  1.upto(num) do |dividand|
    results << dividand if num % dividand == 0
  end
  results
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute