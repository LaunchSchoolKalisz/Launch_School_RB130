watering_needs = "low"

  case watering_needs
  when "low"
    watering_needs = "1"
    me = "marts"
  when "medium"
    watering_needs = "3"
    me = "paige"
  when "high"
    watering_needs = "5"
    me = "ben"
  end

puts watering_needs
puts me

arr = [1, 2, 3]

# for i in arr do
#   a = 5      # a is initialized here
# end

# puts a       # is it accessible here?