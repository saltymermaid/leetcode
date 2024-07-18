class Solution(object):
    def topKFrequent(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: List[int]
        """
        numDict = {}
        for num in nums:
            if num not in numDict:
                numDict[num] = 1
            else:
                numDict[num] += 1
        orderedDict = sorted(numDict.items(), key=lambda kv: (kv[1], kv[0]), reverse=True)
        orderedKeys = [val[0] for val in orderedDict]
        return orderedKeys[:k]

def test(nums, k, expectedResult):
    sol = Solution()
    actualResult = sol.topKFrequent(nums, k)
    print(actualResult)
    diff = [x for x in expectedResult if x not in actualResult]
    print(len(diff) <= 0)

nums = [1,1,1,2,2,3]
k = 2
result = [1, 2]
test(nums, k, result)

nums = [1]
k = 1
result = [1]
test(nums, k, result)