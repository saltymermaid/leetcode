# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
  rows = grid.length
  perimeter = 0
  grid.each_with_index do |row, i|
    columns = row.length
    row.each_with_index do |square, j|
      next if square == 0

      left = j == 0 ? 1 : 1 - grid[i][j-1]
      right = j == columns - 1 ? 1 : 1 - grid[i][j+1]
      top = i == 0 ? 1 : 1 - grid[i-1][j]
      bottom = i == rows - 1 ? 1 : 1 - grid[i+1][j]

      perimeter += left + right + top + bottom
    end
  end
  perimeter
end

puts island_perimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]])
puts island_perimeter([[1]])
puts island_perimeter([[1,0]])