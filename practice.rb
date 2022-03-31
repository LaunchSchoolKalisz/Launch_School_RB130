

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
p plants_info

plants_info = [["peace lily", "medium"], ["rubber plant, medium"], ["bonsai", "high"], ["succulant", "low"]]

def plant_mom(plant_info)
  plant, watering_needs = plant_info[0], plant_info[1]
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
p plants_info