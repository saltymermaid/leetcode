def can_place_flowers(flowerbed, n)
  for i in 0...flowerbed.length do
    puts i
    next if (i == 0 && flowerbed[i..i+1].include?(1))
    puts "beep #{flowerbed[i..i+1]}"
    next if (i == flowerbed.length - 1 && flowerbed[i-1..i].include?(1))
    puts "bop"
    next if (flowerbed[i-1..i+1].include?(1))
    puts 'bip'

    flowerbed[i] = 1
    n-= 1
  end
  return n <= 0
end

puts can_place_flowers([0,0,1,0,0],1)