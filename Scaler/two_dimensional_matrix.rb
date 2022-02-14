class TwoDimensionMatrix
  def self.transpose(arr)
    for i in (0...arr.length)
      for j in (0..i)
        temp = arr[i][j]
        arr[i][j] = arr[j][i]
        arr[j][i] = temp
      end
    end
    return arr
  end

  def self.rotate(arr, degree)
    return arr if degree == 0 || degree == 360
    return reverse_col(transpose(arr)) if degree == 90
    return reverse_row(reverse_col(arr)) if degree == 180
    return reverse_row(transpose(arr)) if degree == 270

    raise "Enter a valid degree !"

  end

  def self.reverse_row(arr)
    starting = 0
    ending = arr.length - 1

    while ending > starting
      for i in (0...arr.length)
        temp = arr[starting][i]
        arr[starting][i] = arr[ending][i]
        arr[ending][i] = temp
      end
      starting += 1
      ending -= 1
    end
    return arr
  end

  def self.reverse_col(arr)
    starting = 0
    ending = arr.length - 1

    while ending > starting
      for i in (0...arr.length)
        temp = arr[i][starting]
        arr[i][starting] = arr[i][ending]
        arr[i][ending] = temp
      end
      starting += 1
      ending -= 1
    end
    return arr
  end
end

arr2 = [
  [1, 2],
  [3, 4]
]
arr3 = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
arr4 = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9, 10, 11, 12],
  [13, 14, 15, 16]
]
print TwoDimensionMatrix.rotate(arr2.map(&:clone), 0)
puts
print TwoDimensionMatrix.rotate(arr3.map(&:clone), 90)
puts
print TwoDimensionMatrix.rotate(arr4.map(&:clone), 180)
puts
print TwoDimensionMatrix.rotate(arr4.map(&:clone), 270)
puts
print TwoDimensionMatrix.rotate(arr4.map(&:clone), 360)
