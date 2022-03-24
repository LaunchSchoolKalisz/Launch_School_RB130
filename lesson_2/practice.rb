def retained_array
  arr = []
  Proc.new do |el|
    arr << el
    arr
  end
end

#rr = retained_array
p retained_array.call('one') #=> ["one"]
p retained_array.call('two') #=> ["one", "two"]
p retained_array.call('three') #=> ["one", "two", "three"]