class GamesController < ApplicationController
  before_action :log_page_view
  
  # New creates a new game, with the board having nine arrays of empty strings. Has to be empty so that it can tell if there's a value or still empty (versus nil).
  def new # the input
    @game = Game.new
    @game.new_game
  end

  def create # the save
    @game = Game.new
    @game.update_board(params)
    if @game.save
      redirect_to action: 'new' # redirects to new game
    else
      render 'new' # renders new board if validation fails.
    end
  end
end
