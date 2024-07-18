class Solution(object):
    def containsDuplicate(nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        num_set = set()
        orig_len = len(nums)
        if len(nums) <= 1:
            return False
        for i, num in enumerate(nums):
            num_set.add(num)
            if i / 5 == 0 and len(num_set) != i + 1:
                return True
        return orig_len != len(num_set)
    
    print (containsDuplicate([1,2,3,1]))
    print (containsDuplicate([1,2,3,4]))
    print (containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
    print (containsDuplicate([0]))
    print (containsDuplicate([]))
    print (containsDuplicate([3,1]))
    