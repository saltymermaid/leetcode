def two_sum(nums, target)
  complements = {}
  nums.each_with_index do |num, i|
    comp = target - num
    if !complements[num].nil?
        return [i, find_index(nums, comp)]
    else
        complements[comp] = i
    end
  end
end

def find_index(nums, target)
  nums.each_with_index do |num, i|
      if num == target
          return i
      end
  end
end

puts two_sum([2,7,11,15], 9).to_s
puts two_sum([0,4,3,0], 0).to_s
puts two_sum([-1,-2,-3,-4,-5], -8).to_s
