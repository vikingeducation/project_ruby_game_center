# Controls the game play
class ConnectFour
# initialize
  def initialize
    # set up the board
    @board = Board.new

    # set up the players
    @player_x = Player.new("Player 1", :x, @board)
    @player_y = Player.new("Player 2", :y, @board)

    # assign the starting player
    @current_player = @player_x
  end

# play
  def play
    # loop infinitely
    loop do
      # call the board rendering method
      @board.render

      # ask for column from the current player
      @current_player.get_column

      # break the loop IF the game is over
      break if check_game_over

      # switch players
      switch_players
    end
  end

# check_game_over
# check_victory
# check_draw

# check_victory
# IF board says current player's piece has
# a winning_combination?
# display a victory message

# check_draw
# IF board says it's full
# display a draw message

# switch_players
# PlayerX >> PlayerO or vice versa
end