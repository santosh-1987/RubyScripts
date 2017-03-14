class Substring

  def initialize(name,substr)
    @name= name
    @substr = substr
  end

  def check_sub_str
    splitted_str = @substr.split("")
    indexes = get_index(splitted_str[0])
    indexes.each do |index|
      start_point = index
      end_point = index + splitted_str.length
      puts "Start => #{start_point}, End => #{end_point}"
       if @substr == @name[start_point ... end_point ]
         return "Substring #{@substr} Found in String #{@name}"
         break
       end
    end
    return "No Substring Found"
  end

  def get_index(char)
    indexes = []
    @name.split("").each_with_index do |element,index|
     if element == char
       indexes << index
     end
    end
    puts indexes
    return indexes
  end

end

sub_str = Substring.new("Santosh Kumar Mohanty Kumi","Kumi")
puts sub_str.check_sub_str


=begin

"Santosh Kumar Mohanty"

"sh Kio"


=end