require 'json'

class FileCache
  def initialize
    @values = {}
  end

  def set(key, value)
    @values[key] = value
    cache = File.new('cache.txt', 'w')
    cache.write @values.to_json
    cache.flush
  end

  def get(key)
    if @values.empty? and File.exists? 'cache.txt'
      @values = JSON.parse(File.read 'cache.txt')
    end

    @values[key]
  end

end
