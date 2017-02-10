class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair = lookup(key)
    if pair.empty?
      @map << [key, value]
    else
      pair[1] = value
    end
  end

  def lookup(key)
    pair = @map.select { |el| el.first == key }
  end

  def remove(key)
    pair = @map.delete_if { |el| el.first == key }
  end

  def show
    new_map = @map.dup
    p new_map
    new_map
  end
end

m = Map.new
m.assign(1, "a")
m.assign(2, "b")
m.assign(3, "c")
m.show
p m.lookup(2)
m.remove(2)
m.show
