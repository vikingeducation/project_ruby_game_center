class Board

  # board = [
  #    0  1  2  3  4  5  6
  #   [r, b, r, b, b, b, b], # board[0]
  #   [0, 0, 0, 0, 0, b, 0], # board[1]
  #   [0, 0, 0, 0, 0, b, 0],
  #   [0, 0, 0, 0, 0, b, 0], # board[3]
  #   [0, 0, 0, 0, 0, 0, 0], # board[4]
  #   [0, 0, 0, 0, 0, 0, 0]
  # ]

  def initialze
    @board = # 0  1  2  3  4  5  6
              [
              [0, r, 0, 0, 0, 0, 0], # 0
              [0, 0, 0, 0, 0, 0, 0], # 1
              [0, 0, 0, 0, 0, 0, 0], # 2
              [0, 0, 0, 0, 0, 0, 0], # 3
              [0, 0, 0, 0, 0, 0, 0], # 4
              [0, 0, 0, 0, 0, 0, 0]  # 5
              ]
  end

  # r says: 2
  # board[x][1]

  # return board array
  def update(input, player)
    if board[5][input] == 0
      board[][input - 1] = color

  end

  def valid_move?

  end


    # horizontal:
      # each row that has 4 or more values
        # find a starting coordinate [0, 1, 2, 3] == player
          # check the final coordinate: [index + 3] == player
            # check the 3rd coordinate: [index + 2]
              # check the 2nd coord: [index + 1]
                # return true => win condition

    # vertical:
      # use .transpose

    # diagonal:
      # starting points => x: [0..3] y: [0..2]
      # coordinate system
        # check if a coordinate == player/color: [0][0]
          # find the last (4th value) [index+3][index+3] == player
            # find 3rd
              # find 2nd
                # return true
      # reverse each array => repeat

  # instance of board: keeps track of moves
  # return what the board is

end