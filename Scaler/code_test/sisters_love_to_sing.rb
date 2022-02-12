require 'pry'

def main(singing_minutes)
  # singing_minutes = gets.strip.split(" ").map(&:to_i)
  ananya_start, ananya_end = [singing_minutes[0], singing_minutes[1]]
  bhavya_start, bhavya_end = [singing_minutes[2], singing_minutes[3]]
  result = 0
  if (ananya_start == bhavya_start)
    if (ananya_end > bhavya_end)
      result = bhavya_start - bhavya_end
    else
      result = ananya_start - ananya_end
    end
  end

  if ((bhavya_end - bhavya_start) > (ananya_end - ananya_start))
    result = ananya_end - ananya_start
  else
    result = bhavya_end - bhavya_start
  end

  if (ananya_start < bhavya_start)
    result = ananya_end - bhavya_start
  else
    result = ananya_start - bhavya_end
  end

  puts result
end

singing_minutes1 = [3, 4, 1, 11]
singing_minutes2 = [2, 5, 4, 6]
singing_minutes3 = [5, 6, 0, 5]
main(singing_minutes1)
main(singing_minutes2)
main(singing_minutes3)