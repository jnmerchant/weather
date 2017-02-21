require 'pry'

def display_current_conditions(current_conditions)
  puts "The current conditions in #{current_conditions["current_observation"]["display_location"]["full"]} as of"
  puts "#{current_conditions["current_observation"]["observation_time_rfc822"]} are:"
  puts "Weather - #{current_conditions["current_observation"]["weather"]}"
  puts "Temp - #{current_conditions["current_observation"]["temperature_string"]}"
  puts "Relative Humidity - #{current_conditions["current_observation"]["relative_humidity"]}"
  puts "Wind - #{current_conditions["current_observation"]["wind_string"]}"
end

def display_ten_day_forecast(ten_day_forecast)
end

def display_weather_alerts(weather_alerts)
  number_of_alerts = weather_alerts["alerts"].length
  if number_of_alerts == 0
    puts "There are no current weather alerts."
  else
    puts "Weather Alerts:"
    i = 0
    number_of_alerts.times do
      puts "Current alert - #{weather_alerts["alerts"][i]["description"]}"
      puts "Message: #{weather_alerts["alerts"][i]["message"]}"
      puts "Expires - #{weather_alerts["alerts"][i]["expires"]}"
      i += 1
    end
  end
end

def display_sunrise_sunset(sunrise_sunset)
  puts "Sunrise - #{sunrise_sunset["moon_phase"]["sunrise"]["hour"]}':'#{sunrise_sunset["moon_phase"]["sunrise"]["minute"]}"
  puts "Sunset - #{sunrise_sunset["moon_phase"]["sunset"]["hour"]}':'#{sunrise_sunset["moon_phase"]["sunset"]["minute"]}"
end

def display_hurricane(hurricane)
  binding.pry
  number_of_hurricanes = hurricane["currenthurricane"].length
  if number_of_hurricanes == 0
    puts "There are no current hurricanes impacting the US."
  else
    # puts "Hurricanes:"
    # i = 0
    # number_of_alerts.times do
    #   puts "Current alert - #{hurricane["alerts"][i]["description"]}"
    #   puts "Message: #{hurricane["alerts"][i]["message"]}"
    #   puts "Expires - #{hurricane["alerts"][i]["expires"]}"
    #   i += 1
    # end
  end
end
