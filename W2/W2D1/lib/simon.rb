class Simon
  attr_accessor :sequence_length, :game_over, :seq
  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @colors = ["red", "blue", "yellow", "green"]
  end

  def add_random_color
    @seq << @colors[rand(4)]
  end

  def play
    until @game_over
      take_turn
      round_success_message
      # @game_over = true
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1 unless @game_over
  end

  def show_sequence
    add_random_color
    p @seq
  end

  def require_sequence
    
  end

  def round_success_message
    puts "Success!"
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
