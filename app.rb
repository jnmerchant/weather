require_relative 'lib/weather'
require_relative 'lib/helpers'
require_relative 'lib/display'
require 'pry'

def main
  current_condition_cache = set_up_memory_cache
  ten_day_forecast_cache = set_up_memory_cache
  weather_alert_cache = set_up_memory_cache
  sunrise_sunset_cache = set_up_memory_cache
  hurricane_cache = set_up_memory_cache
  # file_cache = set_up_file_cache

  display_input_prompt
  location = get_user_input

  current_conditions = get_current_conditions(current_condition_cache, location)
  ten_day_forecast = get_ten_day_forecast(ten_day_forecast_cache, location)
  weather_alerts = get_weather_alerts(weather_alert_cache, location)
  sunrise_sunset = get_sunrise_sunset(sunrise_sunset_cache, location)
  hurricane = get_hurricanes(hurricane_cache, location)

  display_current_conditions(current_conditions)
  display_ten_day_forecast(ten_day_forecast)
  display_weather_alerts(weather_alerts)
  display_sunrise_sunset(sunrise_sunset)
  display_hurricane(hurricane)

end


main if __FILE__ == $PROGRAM_NAME
