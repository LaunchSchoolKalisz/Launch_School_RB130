

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
  p plant_info #
  puts plants_info
  "We should water the #{plant} #{watering_needs} times this week."
end

puts plant_mom(plants_info[3]) # => We should water the succulant 1 times this week.
