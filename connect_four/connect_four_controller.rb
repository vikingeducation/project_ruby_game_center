
class ConnectFourController

  QUIT_OPTIONS = ["q"]

  def initialize(args = {})
    @game  = args[:game]                  || ConnectFour
    @player_1, @player_2 = args[:players] || [HumanPlayer.new(piece: "X"),
                                              HumanPlayer.new(piece: "O")]
    @active_player = player_2
    @view  = args[:view]                  || GameView
  end

  def play
    loop do
      current_game = game.new
      view.welcome(game.name, current_game.instructions)
      turn_loop(current_game)
      view.end_message(current_game.outcome)
      break unless play_again?
    end
  end

  def turn_loop(game)
    loop do
      game.render
      self.active_player = get_active_player
      player_move = get_player_move(active_player, game)
      game.add_piece(player_move, player.piece)
      break if game.over?
    end
  end

  def get_player_move(player, game)
    loop do
      view.print_player_move_prompt
      player_input = player.get_move
      quit if QUIT_OPTIONS.include?(player_input)
      break if game.valid_move?(player_input)
    end
    player_input
  end

  protected
    attr_writer :active_player, :game
  private
    attr_reader :active_player, :game, :view, :player_1, :player_2

    def get_active_player
      active_player == player_1 ? player_2 : player_1
    end

    def play_again?
      view.print_play_again_prompt
      player_input = player.get_input
      player_input == "yes" ? true : false
    end

    def quit
      exit
    end
end