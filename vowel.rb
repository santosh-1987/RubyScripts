VOWEL = ["a","e","i","o","u"]
def paragraph(string)
  vowel_word = []
  if string.is_a?(String)
    string.split(" ").each do |word|
      count = 0
      VOWEL.each do |vowel|
        count+= word.downcase.count(vowel)
      end
      vowel_word << {word => count} if count > 0
    end
  end
  return vowel_word.sort_by{|word| word.values}.map(&:keys).flatten
end
string = "I am Santosh Mohanty from jeyporee Koraput Odisha \noooaeioooo Friends how are you !!!"
puts string
print paragraph(string)