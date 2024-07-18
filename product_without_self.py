from typing import List


class Solution:
    def productExceptSelfNaive(self, nums: List[int]) -> List[int]:
        prod = 1
        non_zero = 1
        zero_flag = False
        for element in nums:
            prod *= element
            if element != 0:
                non_zero *= element
            else:
                if zero_flag:
                    non_zero = 0
                zero_flag = True
        prods = [prod // element if element != 0 else non_zero for element in nums]
        return prods
    
    def productExceptSelfSlow(self, nums: List[int]) -> List[int]:
        start_nums = [1]
        end_nums = [1]
        start_prod = 1
        end_prod = 1
        total_nums = len(nums)
        for element in nums:
            start_prod *= element
            start_nums.append(start_prod)
        for _, element in reversed(list(enumerate(nums))):
            end_prod *= element
            end_nums.append(end_prod)
        end_nums = end_nums[total_nums - 1::-1]
        start_nums = start_nums[:total_nums]
        prods = [start_nums[i] * end_nums[i] for i in range(len(nums))]
        return prods
    
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        total_nums = len(nums)
        start_nums = [1] * total_nums
        end_nums = [1] * total_nums
        for i in range(1, total_nums):
            start_nums[i] = start_nums[i-1] * nums[i - 1]
        for i in range(total_nums - 2, -1, -1):
            end_nums[i] = end_nums[i + 1] * nums[i + 1]
        prods = [start_nums[i] * end_nums[i] for i in range(total_nums)]
        return prods

def test(nums, expected_output, function):
    sol = Solution()
    actual_ouput = function(sol, nums)
    print (actual_ouput == expected_output)

nums = [1,2,4,6]
expected = [48,24,12,8]
test(nums, expected, Solution.productExceptSelfNaive)
test(nums, expected, Solution.productExceptSelf)
print()
# nums = [-1,0,1,2,3]
# expected = [0,-6,0,0,0]
# test(nums, expected, Solution.productExceptSelfNaive)
# test(nums, expected, Solution.productExceptSelf)
# print()
# nums = [-1,0,1,0,3]
# expected = [0,0,0,0,0]
# test(nums, expected, Solution.productExceptSelfNaive)
# test(nums, expected, Solution.productExceptSelf)
# print()

# i n s  e  o  formula
# 0 1 1  1  48 1 * start[3]
# 1 2 2  48 24 end[2] * start[1] 
# 2 4 8  24 12 end[3] * start[2]
# 3 6 48 6  8  end[1] * start[3]
