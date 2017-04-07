=begin
MineSweeper Game
Sample I/P
Arbitrary Array
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
class Mine
  attr_accessor :mine,:grid_size
  def initialize(grid_size)
    @grid_size=grid_size.to_i
    @mine =[]
    # Populate Grid with with Mines and Dummys
    populate_grid
  end

  def sweep
    dummy_mine = fill_dummy_mine
    print_mines(dummy_mine)
    start_sweep(dummy_mine)
  end

  private
  # Print Mines after it is opned or flagged
  def fill_dummy_mine
    return @mine.map{|row| ['x'] * row.size}
  end
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
    matched_data = input.match(/^(?<command>(o|f))\((?<row>\d+),(?<col>\d+)\)/)
    return 0 if matched_data.nil?
    row = matched_data['row'].to_i
    col = matched_data['col'].to_i
    data = @mine[row][col] rescue 3
    return 3 if data.nil? || row.nil? || col.nil? || row.to_i < 0 || col < 0
    return 4 if dummy_mine[row][col] != "x"
    if @mine[row][col] == "m"
      flag = matched_data['command'] == "f"
      dummy_mine[row][col] = flag ? "f" : "m"
      return flag ? 1 : -1
    else
      dummy_mine[row][col] = matched_data['command']
      return 1
    end
  end

  def start_sweep(dummy_mine)
    loop do
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
          print_mines(dummy_mine)
        else
          print_mines(dummy_mine)
          puts "You Stepped Over a Mine"
          break if dummy_mine = @mine
        end
    end
  end
end

m = Mine.new(3)
m.sweep
