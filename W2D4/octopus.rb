require 'benchmark'
def sluggish_find_largest(arr)
  arr.each_with_index do |x, i|
    is_largest = true
    arr.each_with_index do |y, j|
      if x < y
        is_largest = false
        break
      end
    end
    return x if is_largest
  end

  nil

end

def dominant_find_largest(arr)
  sorted_arr = arr.sort
  sorted_arr.last
end

def clever_find_largest(arr)
  largest = arr.first
  arr.each do |x|
    largest = x if x > largest
  end
  largest
end


def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |dir, i|
    return i if dir == direction
  end
  nil
end

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
              "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }
