require 'test/unit'
require 'ugly_trivia/game'

class TriviaTest<Test::Unit::TestCase
  PLAYER=0

  attr_reader :game

  def setup
    @game = UglyTrivia::Game.new

    def game.in_penalty_box 
      @in_penalty_box
    end

    def game.places
      @places
    end

    def game.current_player= current_player
      @current_player = current_player
    end

    def game.players
      @players
    end

    def game.puts str
      @log = (@log||'') + str + "\n"
    end

    def game.log
      @log
    end

    game.current_player = PLAYER
    game.players[PLAYER] = "Chet"
    game.in_penalty_box[PLAYER] = false
  end

  def test_when_not_in_penalty_box_move_current_player
    game.places[PLAYER] = 2
    game.roll 3
    assert_equal 5, game.places[PLAYER]
  end

  def test_player_goes_around_board
    game.places[PLAYER] = 10
    game.roll 4
    assert_equal 2, game.places[PLAYER]
  end

  def test_the_location_and_category_are_displayed
    game.places[PLAYER] = 2
    game.roll 3
    assert_equal "Chet is the current player\nThey have rolled a 3\nChet's new location is 5\nThe category is Science\nScience Question 0\n", game.log
  end

  def test_after_player_moves_game_asks_question
    def game.ask_question
      @method_ask_question_got_called = true
    end

    def game.method_ask_question_got_called
      @method_ask_question_got_called
    end

    assert ! game.method_ask_question_got_called
    game.roll 1
    assert game.method_ask_question_got_called
  end

  def test_should_get_out_of_the_penality_box
    game.in_penalty_box[PLAYER] = true
    game.roll 5
    assert_equal 
  end
end

