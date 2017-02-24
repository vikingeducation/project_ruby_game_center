=begin
  Public interface:
    initialize
    choose_column

  Test paths:
    choose_column
      - test it with a mock
      - test for valid input, e.g. q, Q, 1 to 7
      - test for invalid input (anything else)
=end

module ConnectFour

  class Human < Player
    def initialize(name, marker)
      super
    end

    # asks human player which column to place his marker in
    def choose_column
      print "Please enter the column you want to place your marker in: "
      column = gets.chomp.downcase

      # allow player to quit game by entering 'q'
      if column == "q"
        return column
      else
        column = column.to_i
        until (1..7).include?(column)
          print "That is an invalid column. Please enter a number from 1 to 7: "
          column = gets.chomp
        end
      end

      column
    end
  end
end