require 'pry'

class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Center column
    [2,5,8], # Right column
    [0,4,8], # Diagonal down
    [6,4,2], # Diagonal up
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "-----------"
  end


  def input_to_index(input)
    index = input.to_i - 1
    index
  end


  def move(index, token = X)
    @board[index] = token
  end


  def position_taken?(index)
    @board[index] != " "
  end


  def valid_move?(index)
    !position_taken?(index) && index.between?(0,9)
    # binding.pry
  end


  def turn_count
    @board.count{|t| t == "X" || t == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def turn
    puts "Please enter move between 1 & 9:"
    input = gets.to_i
    index = input_to_index(input)
    # binding.pry
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Invalid move, please try again."
      turn
    end
  end


  def won?
  # 
  #   WIN_COMBINATIONS.find do |combo|
  #     # binding.pry
  #     win = []
  #     if combo.each {|x| win << @board[x]}
  #       win.all?("X" || "O")
  #     else
  #       false
  #     end
  #   end
  # end

    WIN_COMBINATIONS.find do |combo|
      winners = @board[combo]
      if winners.all?("X" || "O")
        combo
      else
        false
      end
    end
  end

  def full?
    !@board.any?(" ")
  end


  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    #binding.pry
    winner = won?
    winner
    binding.pry

    @board[winner]
    # binding.pry
  end

end
