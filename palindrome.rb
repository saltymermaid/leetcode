# def is_palindrome(x)
#   arr = x.to_s
#   len = arr.length - 1
#   mid = len / 2
#   for i in 0..mid do
#     next if arr[i] == arr[len - i]
#     return false
#   end
#   return true
# end

def is_palindrome(x)
  return false if x < 0
  return true if x < 10

  reverse = 0
  forward = x.clone
  while x > 0 do
    reverse *= 10
    reverse += x % 10
    x /= 10
  end
  tc = 0
  while forward > 0 && tc < 20
    tc += 1
    if forward % 10 == reverse % 10
      forward /= 10
      reverse /= 10
      next
    else
      return false
    end
  end
  return true
end

puts is_palindrome(13531)
puts is_palindrome(13579)
puts is_palindrome(1)
puts is_palindrome(-323)