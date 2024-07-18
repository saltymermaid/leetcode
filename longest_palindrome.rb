# def longest_palindrome(s)
#   s_len = s.length
#   return s if s_len <= 1
#   return s if check_string(s)
#   longest = 1
#   palindrome = s[0]
#   for i in 0...s_len do
#     if s_len - i >= longest
#       for j in i...s_len do
#         substring = s[i..j]
#         if check_string(substring) && substring.length > longest
#           longest = substring.length
#           palindrome = substring
#         end
#       end
#     end
#   end
#   palindrome
# end

def longest_palindrome(s)
  s_len = s.length
  return s if s_len <= 1
  return s if check_string(s)
  longest = 1
  palindrome = s[0]
  for i in 0...s_len do
    if s_len - i >= longest
      for j in i...s_len do
        substring = s[i..j]
        if check_string(substring) && substring.length > longest
          longest = substring.length
          palindrome = substring
        end
      end
    end
  end
  palindrome
end

def longest_palindrome_naive(s)
  s_len = s.length
  return s if s_len <= 1
  return s if check_string(s)
  longest = 1
  palindrome = s[0]
  for i in 0...s_len - 1 do
    j = 1
    2.times do
      start = i
      finish = i + j
      substring = s[start..finish]
      while start >= 0 && finish <= s_len - 1 && check_string(substring) do
        substring = s[start..finish]
        if check_string(substring) && substring.length > longest
          longest = substring.length
          palindrome = substring
        end
        start -= 1
        finish += 1
      end
      j += 1
    end
  end
  palindrome
end

def check_string(candidate)
  start = 0
  finish = candidate.length - 1
  while start < finish
    if candidate[start] != candidate[finish]
      return false
    end
    start += 1
    finish -= 1
  end
  true
end

# puts longest_palindrome('babad') # bab or aba
# puts longest_palindrome('zyyz') # zyz
# puts longest_palindrome('12321') # 12321
# puts longest_palindrome('mnno') # nn
# puts longest_palindrome('abb') # bb
# puts longest_palindrome('') # nil
# puts longest_palindrome('v') # v
# puts longest_palindrome('13579') # nil
# puts longest_palindrome('12343') # 343
# puts longest_palindrome('12323') # 232
# puts longest_palindrome('12') # 1
# puts longest_palindrome('11') # 11
# puts longest_palindrome('12341') # 1
# puts longest_palindrome('abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa')
# puts longest_palindrome('321012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210012321001232100123210123210012321001232100123210123')
puts longest_palindrome('whdqcudjpisufnrtsyupwtnnbsvfptrcgvobbjglmpynebblpigaflpbezjvjgbmofejyjssdhbgghgrhzuplbeptpaecfdanhlylgusptlgobkqnulxvnwuzwauewcplnvcwowmbxxnhsdmgxtvbfgnuqdpxennqglgmspbagvmjcmzmbsuacxlqfxjggrwsnbblnnwisvmpwwhomyjylbtedzrptejjsaiqzprnadkjxeqfdpkddmbzokkegtypxaafodjdwirynzurzkjzrkufsokhcdkajwmqvhcbzcnysrbsfxhfvtodqabvbuosxtonbpmgoemcgkudandrioncjigbyizekiakmrfjvezuzddjxqyevyenuebfwugqelxwpirsoyixowcmtgosuggrkdciehktojageynqkazsqxraimeopcsjxcdtzhlbvtlvzytgblwkmbfwmggrkpioeofkrmfdgfwknrbaimhefpzckrzwdvddhdqujffwvtvfyjlimkljrsnnhudyejcrtrwvtsbkxaplchgbikscfcbhovlepdojmqybzhbiionyjxqsmquehkhzdiawfxunguhqhkxqdiiwsbuhosebxrpcstpklukjcsnnzpbylzaoyrmyjatuovmaqiwfdfwyhugbeehdzeozdrvcvghekusiahfxhlzclhbegdnvkzeoafodnqbtanfwixjzirnoaiqamjgkcapeopbzbgtxsjhqurbpbuduqjziznblrhxbydxsmtjdfeepntijqpkuwmqezkhnkwbvwgnkxmkyhlbfuwaslmjzlhocsgtoujabbexvxweigplmlewumcone')