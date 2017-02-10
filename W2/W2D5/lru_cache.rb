class LRUCache
  def initialize(size = 4)
    @cache = Array.new(size)
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)
      index = @cache.index(el)
      @cache.delete_at(index)
      @cache << el
    else
      lru = @cache.shift
      @cache << el
    end

    el
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
  end

  private
  # helper methods go here!

end
