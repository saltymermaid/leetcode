def chess(x, y)
  spaces = { 0 => 'B', 1 => 'W' }
  for i in 0...x do
    for j in 0...y do
      print spaces[(i % 2) ^ (j % 2)]
    end
    puts
  end
end

chess(5, 4)