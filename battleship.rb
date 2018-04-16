class BattleShip
  attr_accessor :battle_field, :grid_size

  def initialize(grid_size)
    @grid_size=grid_size.to_i
  end


  def sweep
    dummy_field = []
    0.upto(@grid_size-1).each do |pos|
      dummy_field[pos] = ["*"]*grid_size
    end
    @battle_field = dummy_field
    print_battle_field
    start_placing_ships
  end

  private

  def start_placing_ships
    loop do
      puts "Enter the Ship name with Quantity that is to be placed ?- E.g Tug-2 or Destroyer-3"
      ships_with_num = gets.chomp.split('-')
      place_ships(ships_with_num[0], ships_with_num[1])
      break if get_random_fields.empty?
    end
  end

  def get_random_fields
    @empty_battle_field = []
    @battle_field.each_index { |k|
      field = @battle_field[k]
      field.each_index { |v|
        @empty_battle_field << "#{k},#{v}" if field[v] == "*"
      }
    }
    if @empty_battle_field.sample.nil?
      return []
    else
      return @empty_battle_field.sample.split(",")
    end

  end

  def print_battle_field
    @battle_field.map { |field|
      puts "#{field.join("  ")}"
    }
  end

  def place_ships(type, number)
    empty_spaces = @battle_field.flatten.count("*")
    if empty_spaces >= number.to_i
      number.to_i.times do
        # binding.pry
        h,v = get_random_fields.map(&:to_i)
        @battle_field[h][v] = annotate_type(type)
      end
      print_battle_field
    else
      puts "There is No Enough SPace to allocate , only #{empty_spaces} place(s) left"
      return false
    end
  end

  def annotate_type(type)
    case type
      when "Tug"
        return "T"
      when "Destroyer"
        return "D"
      when "Submarine"
        return "S"
      when "BattleShip"
        return "B"
      else
        return "C"
    end
  end
end

STDOUT.puts <<-EOF
    BattleField Program to allocate Battlefield and place Ships randomly
    Usage:
      Enter the Ship name with Quantity that is to be placed ?
      Tug-2
      Places 2 Tugs Randomly
      ^C to exit


EOF

puts "Enter the Field Size in Integer, Ex- 10"
field_size = gets.chomp
if field_size.to_i > 1
  b = BattleShip.new(field_size.to_i)
  puts "Battle Field is Ready !!!"
  b.sweep
else
  puts "Enter a Valid Battle field Size greater than 1"
end


