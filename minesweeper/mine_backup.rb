=begin
MineSweeper Game
Sample I/P
3*3 Array
xxx
xxx
xxx

Player Keys in through Command line
open(0,0) | open(0,1) | flag(0,2) | open(1,1) | ....
0xx       |  00x      | oof       | oof
xxx       |  xxx      | xxx       | xmx
xxx       |  xxx      | xxx       | xxx(Blast You stepped Mine)

=end
require "rubygems"
require "pry"
class Mine
  attr_accessor :mine,:grid_size
  def initialize(grid_size)
    @grid_size=grid_size.to_i
    @mine =[]
    # Populate Grid with with Mines and Dummys
    populate_grid
  end

  def sweep
    dummy_mine = []
    0.upto(@grid_size-1).each do |pos|
      dummy_mine[pos] = ["x","x", "x"]
    end
    print_mines(dummy_mine)
    start_sweep(dummy_mine)
  end

  private
  # Print Mines after it is opned or flagged
  def print_mines(dummy_mine)
    dummy_mine.map {|mine|
      puts "#{mine}"
    }
  end

  def populate_grid
    puts "Enter the minefiled layout:"
    layout = gets.chomp.split(',')
    @mine = layout.map{|row| row.split('')}
  end

  def validate_input(dummy_mine,input)
    return 0 if input[0] != "f" && input[0] != "o"
    row = Integer(input[2]) rescue nil
    col = Integer(input[4]) rescue nil
    return 3 if row.nil? || col.nil? || row >= @grid_size || col >= grid_size || row < 0 || col < 0
    return 4 if dummy_mine[row][col] != "x"
     if @mine[row][col] == "m"
       flag = input[0] == "f"
       dummy_mine[row][col] = flag ? "f" : "m"
       return flag ? 1 : -1
     else
       dummy_mine[row][col] = input[0]
       return 1
     end
  end

  def start_sweep(dummy_mine)
    count = 1
    while count <= @grid_size**2
      print "Please enter a co-ordinate which you want to open/flagEx: o(0,0), f(1,0))\n =>"
      user_input = gets.chomp
      status = validate_input(dummy_mine,user_input)
      case status
        when 0
          puts "Invalid flag"
        when 3
          puts "Invalid Cordinate"
        when 4
          puts "Cordinate Already Opened"
        when 1
          count += 1
          print_mines(dummy_mine)
        else
          print_mines(dummy_mine)
          puts "You Stepped Over a Mine"
          break
        end
    end
    dummy_mine == @mine ? "Game Over" : "Game Incomplete ! Better luck next time !"
  end
end

m = Mine.new(3)
m.sweep
