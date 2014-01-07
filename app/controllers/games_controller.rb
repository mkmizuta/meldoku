class GamesController < ApplicationController

  # New creates a new game, with the board having nine arrays of empty strings. Has to be empty so that it can tell if there's a value or still empty (versus nil).

  def new # the input
    @game = Game.new
    @game.board = 
    [["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""]]
  
    a = (1..9).to_a # fills an array with 1-9

    (0..6).step(3) do |r|  # iterates every three of rows
      (0..6).step(3) do |c| # iterates every three columns
        @game.board[r][c] = a.delete_at(rand(a.size)) # pulls one thing out of a randomly, and deletes it so it can't be repeated and puts in space [r][c].
      end
    end
  end

  def create # the save
    @game = Game.new
    @game.board = 
    [["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""]]
    
    row_names = ("a".."i").to_a # an array of row names listed on new view
    col_name = (1..9).to_a # an array of column names listed on new view

    (0..8).each do |r| # iterate spaces 0-8 on board's rows
      (0..8).each do |c| # iterates spaces 0-8 on board's columns
        @game.board[r][c] = params[(row_names[r]+col_name[c].to_s).to_sym] # makes name from taking row name and column name and changes it to symbol which will match [r][c] params we return. .to_sym so that params can find it.
      end
    end

    if @game.save
      redirect_to action: 'new' # redirects to new game
    else
      render 'new' # renders new board if validation fails.
    end
      
  end
end
