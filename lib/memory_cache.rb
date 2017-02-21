class MemoryCache
  def initialize
    @cache = {}
  end

  def set(key, value)
    @cache[key] = value

    @cache[key]
  end

  def get(key)
    @cache[key]
  end

  def key?(key)
    @cache.key?(key)
  end

  def clear
    @cache.clear
  end
end
