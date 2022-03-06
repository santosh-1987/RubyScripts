require 'pry'

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

  def self.all_diagonals(arr)
    diagonals = []
    array_length = arr.length
    x = 0
    y = 0
    row = 0
    col = 0

    while x < array_length && y < array_length
      sub_array = []
      while col >= 0 && row < array_length
        sub_array << arr[row][col]
        col -= 1
        row += 1
      end

      if sub_array.length < array_length
        sub_array << [0] * (array_length - sub_array.length)
      end

      diagonals << sub_array.flatten

      if y < array_length - 1
        y += 1
      else
        x += 1
      end
      row = x
      col = y
    end
    return diagonals
  end

  def self.matrix_multiplication(a,b)
    col_length = b[0].length
    arr = []
    for i in 0...a.length
      sa = []
      for j in 0...col_length
        sum = 0
        for k in 0...b.length
          sum +=  a[i][k] * b[k][j]
        end
        sa << sum
      end
      arr << sa
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
# print TwoDimensionMatrix.rotate(arr2.map(&:clone), 0)
# puts
# print TwoDimensionMatrix.rotate(arr3.map(&:clone), 90)
# puts
# print TwoDimensionMatrix.rotate(arr4.map(&:clone), 180)
# puts
# print TwoDimensionMatrix.rotate(arr4.map(&:clone), 270)
# puts
# print TwoDimensionMatrix.rotate(arr4.map(&:clone), 360)
#
# print TwoDimensionMatrix.all_diagonals(arr3)
print TwoDimensionMatrix.matrix_multiplication([[1,2,3],[4,5,6]],[[1],[2],[3]])