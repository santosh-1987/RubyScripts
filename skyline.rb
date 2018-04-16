def stroke(skyline)
  level = 0
  strokes = 0
  for height in skyline
    if height > level
      strokes += height - level
      level = height
    elsif height < level
      level = height;
    end
  end
  if strokes > 1000000000
    return -1
  end
  return strokes
end

# n=[1,3,2,1,2,1,5,3,3,4,2]
n = [3,2,1,0,5]
puts stroke(n)
