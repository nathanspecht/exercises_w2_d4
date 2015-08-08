require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :current_player, :board

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @board = Board.new
  end

  def switch_players!
    @current_player = @current_player == @player_one ?
                      @player_two : @player_one
  end

  def play_turn
    @current_player.display(@board)
    pos = @current_player.get_move
    mark = @current_player.mark
    success = @board.place_mark(pos, mark)
    switch_players! if !@board.winner && success
  end

  def play
    while !@board.over?
      play_turn
    end
    puts @board.winner ? "#{@current_player.name} wins." :
                         "Tie." 
  end

end
