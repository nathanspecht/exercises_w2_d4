class ComputerPlayer
  attr_accessor :name, :mark, :board

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    return winning_move if winning_move
    random_move
  end

  def random_move
    @board.empty_spaces.shuffle[0]
  end

  def winning_move
    @board.empty_spaces.each do |pos|
      @board.place_mark(pos, @mark)
      if @board.over?
        @board.place_mark(pos, nil)
        return pos
      end
      @board.place_mark(pos, nil)
    end
    nil
  end

end
