class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        answers = {}
        for i, num in enumerate(nums):
            answers[target - num] = i
        for j, num in enumerate(nums):
            if num not in answers:
                continue
            elif answers[num] == j:
                continue
            else:
                return [j, answers[num]]
        return None



def test(nums, target, expectedResult):
    sol = Solution()
    actualResult = set(sol.twoSum(nums, target))
    diff = [x for x in expectedResult if x not in actualResult]
    print(len(diff) <= 0)

test([2,7,11,15], 9, [0, 1])
test([3,2,4], 6, [1, 2]) # bad
test([3,3], 6, [0, 1])
test([2,5,5,11], 10, [1,2])
test([0,4,3,0], 0, [0,3])
test([-3,4,3,90], 0, [0,2])
