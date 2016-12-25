class Player
  attr_reader :piece, :name

  def initialize(name='Player 2', piece='o')
    @name = name
    @piece = piece
    @move = []
  end

  def reset_moves
    @move = []
  end


end

class Human < Player

  def get_move(board)
    # accept board so that we can verify the validity of the
    until valid_format? && board.valid_move?(move)
      puts "Enter column (1-6) in which you'd like to place your piece. Enter '1' for column 1, '2' for column 2 and so on."
      print "#{@name}: "
      @move = gets.strip
      exit if @move == 'q'
      @move = @move.to_i
      puts
      puts "Please check the format of your move."  unless valid_format?
    end
  end

  def move
    # make sure we pass it in a format that 'board' understands
    @move - 1
  end
  private


  def valid_format?
    !@move.nil? && @move.to_s.length == 1
  end

end
