require_relative 'memory_cache'
require_relative 'file_cache'
require 'httparty' #7bd14592a7e66067
require 'pry'

# http://api.wunderground.com/api/7bd14592a7e66067/forecast10day/q/CA/San_Francisco.json
# This example will return the attributes of STATE/City -- watch upcase for state and upper snake for city

# {key}/geolookup/q/94107.json
# This example will return the geographic attributes of zip code 94107

# {key}/geolookup/q/autoip.json
# This example will return the geographic attributes associated with the IP address location of the user.

def set_up_memory_cache
  memory_cache = MemoryCache.new
end

def get_current_conditions(memory_cache, location)
  if memory_cache.key?(location)
    return memory_cache.get(location)
  end

  response = HTTParty.get("http://api.wunderground.com/api/7bd14592a7e66067/conditions/q/#{location}.json")
  memory_cache.set(location, response.parsed_response)
  response.parsed_response
end

def get_ten_day_forecast(memory_cache, location)
  if memory_cache.key?(location)
    return memory_cache.get(location)
  end

  response = HTTParty.get("http://api.wunderground.com/api/7bd14592a7e66067/forecast10day/q/#{location}.json")
  memory_cache.set(location, response.parsed_response)
  response.parsed_response
end

def get_sunrise_sunset(memory_cache, location)
  if memory_cache.key?(location)
    return memory_cache.get(location)
  end

  response = HTTParty.get("http://api.wunderground.com/api/7bd14592a7e66067/astronomy/q/#{location}.json")
  memory_cache.set(location, response.parsed_response)
  response.parsed_response
end

def get_weather_alerts(memory_cache, location)
  if memory_cache.key?(location)
    return memory_cache.get(location)
  end

  response = HTTParty.get("http://api.wunderground.com/api/7bd14592a7e66067/alerts/q/#{location}.json")
  memory_cache.set(location, response.parsed_response)
  response.parsed_response
end

def get_hurricanes(memory_cache, location)
  if memory_cache.key?(location)
    return memory_cache.get(location)
  end

  response = HTTParty.get("http://api.wunderground.com/api/7bd14592a7e66067/currenthurricane/view.json")
  memory_cache.set(location, response.parsed_response)
  response.parsed_response
end
