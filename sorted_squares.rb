# @param {Integer[]} nums
# @return {Integer[]}
def sorted_squares(nums)
  squares = []
  squares = nums.map{ |num| num * num }
  squares.sort
end

sorted_squares([-4,-1,0,3,10])
sorted_squares([-7,-3,2,3,11])