
class Board

  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.all?{|j| j == "X" || j == "O"}
  end

  def turn_count
    @cells.count {|j| j == "X" || j == "O"}
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    elsif position(input) == " "
      false
    end
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1, 9)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token 
  end

end
