# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  add1 = 0
  add2 = 0
  nummy = [[[], l1], [[], l2]]
  nummy.each do |set|
    current = set[1]
    loop do
      set[0] << current.val
      # puts "add: #{set[0]} | current val: #{current.val}"
      break if current.next.nil?
      current = current.next
    end
  end
  add1 = reverse_num(nummy[0][0])
  add2 = reverse_num(nummy[1][0])
  sum = add1 + add2
  # puts "#{add1} + #{add2} = #{sum}"
  if sum == 0
    return create_list([sum])
  end
  sum_arr = []
  while sum > 0 do
    sum_arr << sum % 10
    sum /= 10
  end
  return create_list(sum_arr)
end

def reverse_num(str_num)
  num = 0
  str_num.reverse!
  str_num.each do |str|
    num *= 10
    num += str.to_i
  end
  num
end

def create_list(nums)
  list_length = nums.length
  top_node = nil
  current_node = nil
  next_node = nil
  nums.each_with_index do |num, i|
    next_node = ListNode.new(num.to_s)
    if i == 0
      top_node = next_node
      current_node = next_node
    else
      current_node.next = next_node
    end
    current_node = next_node
  end
  top_node
end

def print_list(node)
  current = node
  loop do
    print current.val
  break if current.next.nil?
    current = current.next
  end
  puts
end

def run_compare(arr1, arr2)
  list1 = create_list(arr1)
  # print_list(list1)
  list2 = create_list(arr2)
  # print_list(list2)
  response = add_two_numbers(list1, list2)
  print print_list(response)
end

run_compare([2,4,3], [5,6,4])
# run_compare([0], [0])
# run_compare([1], [1])
# run_compare([9], [9])
# run_compare([9,9,9,9,9,9,9], [9,9,9,9])
run_compare([0,8,6,5,6,8,3,5,7], [6,7,8,0,8,5,8,9,7])
