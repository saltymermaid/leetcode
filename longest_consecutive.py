from collections import defaultdict
import math
from typing import List

class Solution:
    # Longest Consecutive Sequence
    # Given an array of integers nums, return the length of the longest consecutive sequence of elements.
    # A consecutive sequence is a sequence of elements in which each element is exactly 1 greater than the previous element.
    # You must write an algorithm that runs in O(n) time.

    def longestConsecutive(self, nums: List[int]) -> int:
        all_nums = set(nums)
        longest = 0
        for num in nums:
            if num - 1 not in all_nums:
                sequence = 1
                while num + sequence in all_nums:
                    sequence += 1
                longest = max(longest, sequence)
        return longest  

def test(sequence, expected_result):
    sol = Solution()
    return sol.longestConsecutive(sequence) == expected_result

nums = [2,20,4,10,3,4,5]
expected_result = 4 # [2,3,4,5]
print(test(nums, expected_result))

nums = [0,3,2,5,4,6,1,1]
expected_result = 7 # [0,1,2,3,4,5,6]
print(test(nums, expected_result))

