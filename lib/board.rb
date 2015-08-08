class Board
  attr_reader :grid

  def initialize(grid = Array.new(3) { Array.new(3) })
    @grid = grid
  end

  def place_mark(pos, mark)
    if empty?(pos) || mark == nil
      row, col = pos
      @grid[row][col] = mark
    else
      puts "Position unavailable."
      false
    end
  end

  def empty?(pos)
    row, col = pos
    @grid[row][col] != :X && @grid[row][col] != :O
  end

  def winner
    marks = [:X, :O]
    marks.each do |mark|
      return mark if check_rows(mark) ||
                     check_columns(mark) ||
                     check_diagonal_one(mark) ||
                     check_diagonal_two(mark)
    end
    nil
  end

  def over?
    winner || empty_spaces.length == 0 ? true : false
  end

  def check_rows(mark, grid = @grid)
    grid.each do |row|
      count = 0
      row.each do |space|
        count += 1 if space == mark
        return true if count == row.length
      end
    end
    false
  end

  def check_columns(mark)
    check_rows(mark, @grid.transpose)
  end

  def check_diagonal_one(mark)
    pos = 0
    while pos < @grid.length
      return false if @grid[pos][pos] != mark
      pos += 1
    end
    true
  end

  def check_diagonal_two(mark)
    row = 0
    col = @grid.length - 1
    while row < @grid.length
      return false if @grid[row][col] != mark
      row += 1
      col -= 1
    end
    true
  end

  def empty_spaces
    spaces = []
    (0...@grid.length).each do |i|
      (0...@grid.length).each do |j|
        spaces << [i, j] if empty?([i, j])
      end
    end
    spaces
  end

end
