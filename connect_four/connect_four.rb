require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'logic.rb'


class ConnectFour
   
  def initialize
  	@player_1 = Player.build_human_player("red")
    @board = Board.new
    @current_player = @player_1
    @logic = Logic.new
  end


  def print_instructions
    puts "====================================================="
    puts " Welcome to Connect Four! The object of the game"
    puts " is to get four pieces in a row. Your pieces can"
    puts " be vertical, horizontal, or diagonal."
    puts "====================================================="
  end



  def ask_player_type
    
    input = ""
    until ["computer","human"].include?(input)  
    	print "Second player is human or computer? :"
    	input = gets.chomp

    	input == "computer"? (@player_2 = Player.build_computer_player("green")): (@player_2 = Player.build_human_player("green"))               
    end
  end


  def switch_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end


  def player_move(current_player)
    puts "====================================================="
    puts "  Please enter the COLUMN to drop your coin."
    puts "  Valid columns are 0 thru 6."
    puts "  (Think like a programmer, please)"
    puts "  For example 5,0 would place a piece"
    puts "  in the bottom-left corner."
    puts "====================================================="
    puts "#{@current_player.color} player enter your COLUMN:"
    
    column = gets.chomp
    until column =~ /[0-6]/
      puts "Column in invalid format!, Re-Enter: "
      move = gets.chomp
      column = column.to_i
    end 
    
    return move_array
  end


  def add_move(move_array,color)
 	  @board.game_board[move_array[0]][move_array[1]] = color
  end



  def play
    print_instructions
    ask_player_type
    @board.render

    loop do
      move_array = player_move(@current_player)
      # validate_move
      until @board.valid_move?(move_array)
        move_array = player_move(@current_player)
      end

      add_move(move_array,@current_player.color)
      @board.render

      if @logic.straight_win?(@board.game_board,move_array,@current_player.color)
        puts "Congratulations #{@current_player}, you win!"
        break
      end
        
      @current_player = switch_player

    end

  end


end	

game = ConnectFour.new
game.play