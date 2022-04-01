def give_info(element)
  puts element.call 
end

number = '123-456-7891'
my_proc = proc { number }
number = '847-123-4567'

give_info(my_proc)