# @param {String} s
# @return {Integer}

@roman_chars = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}

@prefixes = %w[I X C]
@prefixable = %w[V X L C D M]

def roman_to_int(s)
  num = 0
  for i in 0...s.length do
    this_num = s[i]
    next_num = s[i + 1]
    if (@prefixes.include? this_num) && @prefixable.include?(next_num) && @roman_chars[this_num] < @roman_chars[next_num]
      num -= @roman_chars[this_num]
    else
      num += @roman_chars[this_num]
    end 
  end

  num
end

puts roman_to_int("DCXXI") # 621
puts roman_to_int("LVIII") # 58
puts roman_to_int("MCMXCIV") # 1994