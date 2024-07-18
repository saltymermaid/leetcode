# def length_of_longest_substring(s)
#   full_string = s.chars
#   candidate = ''
#   current = ''
#   starting_point = 0
#   full_string.each do |char|
#     if current.include? char
#       puts "current: #{current} | char: #{char}"
#       dupe_index = full_string[starting_point..].find_index(char) + starting_point
#       candidate = current if current.length > candidate.length
#       starting_point = dupe_index + 1
#       current = current[starting_point..]
#       puts starting_point
#     end
#     current += char
#     puts "current: #{current} | candidate: #{candidate}"
#   end
#   candidate = current if current.length > candidate.length
#   candidate
# end

# def length_of_longest_substring(s)
#   s_chars = s.chars
#   longest = 0
#   substring = ''
#   s_len = s.length
#   for i in 0..s_len do
#     s_chars[i..].each do |s_char|
#       if substring.include?(s_char)
#         longest = [longest, substring.length].max
#         next
#       end
#       substring += s_char
#     end
#   end
#   longest
# end

def length_of_longest_substring(s)
  s_chars = s.chars
  longest = 0
  s_len = s.length
  return s_len if s_len <= 1

  first_char_index = 0
  pointer = 1
  while pointer != s_len
    substring = s_chars[first_char_index...pointer]
    new_char = s_chars[pointer]
    # puts "Pointer: #{pointer} | substring: #{substring} | new_char = #{new_char}"
    if substring.include? new_char
      dupe = substring.find_index(new_char) + first_char_index
      longest = [longest, pointer - first_char_index].max
      first_char_index = dupe + 1
    end
    pointer += 1
  end
  longest = [longest, pointer - first_char_index].max
  longest
end

puts length_of_longest_substring('abcabcbb') == 3
puts length_of_longest_substring('bbbbb') == 1
puts length_of_longest_substring('pwwkew') == 3
puts length_of_longest_substring('aab') == 2
puts length_of_longest_substring('dvdf') == 3
puts length_of_longest_substring('') == 0