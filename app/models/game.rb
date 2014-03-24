class Game < ActiveRecord::Base
  serialize :board, Array
 
  validate :board_is_valid
  after_initialize :emptyboard

  # emptyboard creates a board that has empty strings.
  def emptyboard
    self.board = [
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""], 
     ["","","","","","","","",""]]
  end

  def new_game
    a = (1..9).to_a # fills an array with 1-9

    (0..6).step(3) do |r|  # iterates every three of rows
      (0..6).step(3) do |c| # iterates every three columns
        self.board[r][c] = a.delete_at(rand(a.size)) # pulls one thing out of a randomly, and deletes it so it can't be repeated and puts in space [r][c].
      end
    end
  end

  def update_board(params)
    row_names = ("a".."i").to_a # an array of row names listed on new view
    col_name = (1..9).to_a # an array of column names listed on new view

    (0..8).each do |r| # iterate spaces 0-8 on board's rows
      (0..8).each do |c| # iterates spaces 0-8 on board's columns
        self.board[r][c] = params[(row_names[r]+col_name[c].to_s).to_sym] # makes name from taking row name and column name and changes it to symbol which will match [r][c] params we return. .to_sym so that params can find it.
      end
    end
  end

  # check_line takes in a row/line, and if there aren't nine numbers, it returns false.
  # (1..9).each takes the range 1-9 and checks to see if each number in that range is included.  If each number 1-9 isn't included, it returns false.
  def check_line(line)
    if line.count != 9
      return false
    end

    (1..9).each { |number| 
      if !line.include? number.to_s
        return false
      end
    }
    return true
  end

  # board_is_valid takes the board, and if there aren't nine numbers, it returns an error.  

  # self.board.each takes a line of that board, and if that line [a] isn't an Array or [b] doesn't have nine numbers in it, it returns an error.

  # (0..8).each counts from index 0 to 8 on the board and calls check_line method to see if that board has all the variables passed through the variable iterator from the range (0..8).  If it doesn't, it returns an error message that specifies which row has the error.

  # If the check_line method doesn't have 1-9 after transposing the board variable, it returns an error specifying the column. Transposing changes it from rows/columns to columns/rows (so instead of three rows of nine columns, we have three columns of nine rows) so that we can check columns too. 

  # (0..6).step(3) do |r| says that for every three (because of step) rows, we're going to take those three rows and do (0..6).step(3) do |c|, which transposes them to columns, flattens it back to a row and calls the check_line method to make sure 1-9 is represented.  0-2 are done first, with 2 added so then it takes the next three rows/columns and so on. This checks 3x3 blocks (our overall grid/board).  

  def board_is_valid
    if self.board.count != 9 
      errors.add(:board, "BOARD ERROR")
      return
    end

    self.board.each { |line| 
      if !line.kind_of?(Array) || line.count != 9
        errors.add(:board, "BOARD ERROR")
        return
      end
    }

    (0..8).each { |iterator|
      if !check_line(self.board[iterator])
        errors.add(:board, "Check row " + (1 + iterator).to_s + " again!")
      end

      if !check_line(self.board.transpose[iterator])
        errors.add(:board, "Check column " + (1 + iterator).to_s + " again!")
      end
    }

    (0..6).step(3) do |r| 
      (0..6).step(3) do |c|
        if !check_line self.board[r..r+2].transpose[c..c+2].flatten
          errors.add(:board, "Check block " + "row " + ((r/3) + 1).to_s + " column " + ((c/3) + 1).to_s + " again!") 
        end
      end
    end

    return true
  end
end
