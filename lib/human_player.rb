class HumanPlayer
  attr_accessor :name, :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    board.grid.each do |row|
      puts "\n"
      row.each do |el|
        print el ? "| #{el} | " : "| * | "
      end
    end
    puts "\n"
  end

  def get_move
    print "WHERE: "
    pos = gets.chomp.split(",").map { |el| el.to_i }
  end

end
