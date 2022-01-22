# method implementation
def times(number)
  counter = 0
  while counter < number do
    yeild(counter)
    counter += 1
  end

  number
end

# method invocation
times(5) do |num|
  puts num
end