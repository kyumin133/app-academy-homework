class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = []
    for i in 0...14
      @cups << ((i % 7 == 6) ? [] : Array.new(4) { :stone })
    end
    # p @cups
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each

  end

  def valid_move?(start_pos)
    unless start_pos.between?(1, 6) || start_pos.between?(7, 12)
      raise "Invalid starting cup"
    end
    true
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].length
    @cups[start_pos] = []

    stones = []
    num_stones.times { stones << :stone }
    i = 1

    opponent_cup = current_player_name == @name1 ? 13 : 6
    until stones.empty?
      unless (start_pos + i) % 14 == opponent_cup
        @cups[(start_pos + i) % 14] << stones.shift
      end
      i += 1
    end

    i -= 1
    render
    next_turn((start_pos + i) % 14, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    current_player_cup = (current_player_name == @name1) ? 6 : 13
    return :prompt if ending_cup_idx == current_player_cup
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? { |el| el.empty? } || @cups[7..12].all? { |el| el.empty? }

    false
  end

  def winner
    sum1 = 0
    sum2 = 0
    for i in 0..6 do
      sum1 += @cups[i].length
      sum2 += @cups[7 + i].length
    end

    return @name1 if sum1 > sum2
    return @name2 if sum2 > sum1
    return :draw
  end
end
