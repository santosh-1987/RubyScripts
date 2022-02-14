=begin

Print the Spiral Array
    CS          CE
RS [01,02,03,04,05]
   [16,17,18,19,06]
   [15,24,25,20,07]
   [14,23,22,21,08]
RE [13,12,11,10,09]
=end
require 'pry'

class SpiralArray
  def self.display(arr)
    return [] if arr.length == 0
    rs = 0
    cs = 0
    re = arr.length - 1
    ce = arr[0].length - 1
    new_arr = []

    while ce >= cs
      #Print First Row
      for i in (rs..ce)
        new_arr << arr[rs][i]
      end
      rs += 1
      # Print Last Column
      # [0][4], [1][4], [2][4]
      for j in (rs..ce)
        new_arr << arr[j][ce]
      end
      ce = ce - 1
      # Print Last row
      #  [4][4],[4][3] .. [4][0]
      ce.downto(cs).each do |k|
        new_arr << arr[re][k]
      end
      re = re - 1
      # Print First Column
      # [0][4], [0][3], [0][2] .. [0][1]
      re.downto(rs).each do |l|
        new_arr << arr[l][cs]
      end
      cs = cs + 1
    end
    return new_arr
  end
end

arr0 = [[1]]
arr2 = [
  [1, 2, 3, 4, 5],
  [16, 17, 18, 19, 6],
  [15, 24, 25, 20, 7],
  [14, 23, 22, 21, 8],
  [13, 12, 11, 10, 9]
]

arr1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print SpiralArray.display(arr0)
puts
print SpiralArray.display(arr1)
puts
print SpiralArray.display(arr2)