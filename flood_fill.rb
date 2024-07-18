# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}
class ImageNode
  attr_accessor :x, :y, :color, :neighbors, :visited

  def initialize(x, y, color = 0)
    @x = x
    @y = y
    @color = color
    @neighbors = []
    @visited = false
  end

  def update_color(color)
    @color = color
    @visited = true
    next_neighbor = find_unvisited_neighbor
    while next_neighbor
      next_neighbor.update_color(color)
      next_neighbor = find_unvisited_neighbor
    end
  end

  def find_unvisited_neighbor
    neighbors.each do |n|
      if n.visited
        next
      else
        return n
      end
      return nil
    end
    nil
  end

  def to_s
    neighbors_to_print = ""
    neighbors.each do |n| 
      neighbors_to_print += "(#{n.x}, #{n.y}) "
    end
    "x: #{x}, y: #{y} | color: #{color} | #{neighbors_to_print} | v? #{visited}"
  end
end

def flood_fill(image, sr, sc, color)
  @pixels = []
  print_image(image)
  build_image(image)
  print_image(output_image)
  source_node = @pixels[sr][sc]
  source_node.update_color(color)
  output_image
end

def build_image(image)
  image.each_with_index do |row, i|
    @pixels[i] = []
    row.each_with_index do |col, j|
      pixel = ImageNode.new(i, j, col)
      unless i == 0
        add_undirected_edge(pixel, @pixels[i - 1][j])
      end
      unless j == 0
        add_undirected_edge(pixel, @pixels[i][j - 1])
      end
      @pixels[i] << pixel
    end
  end
end

def add_undirected_edge(a, b)
  if a.color == b.color
    a.neighbors << b
    b.neighbors << a
  end
end

def output_image
  output = []
  @pixels.each_with_index do |row, i|
    output[i] = []
    row.each do |column|
      output[i] << column.color
    end
  end
  output
end

def print_image(image)
  puts
  image.each do |row|
    row.each do |column|
      print column
    end
    puts
  end
end


image = [[1,1,1],[1,1,0],[1,0,1]]
print_image(flood_fill(image, 1, 1, 2))
puts '-'*10
image = [[0,0,0],[0,0,0]]
print_image(flood_fill(image, 0, 0, 0))