class Solution(object):
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """
        anagrams = {}
        for anaString in strs:
            sortedAnagram = ''.join(sorted(anaString))
            if sortedAnagram not in anagrams:
                anagrams[sortedAnagram] = [anaString]
            else:
                anagrams[sortedAnagram].append(anaString)
        output = [anagrams[key] for key in anagrams]
        return output


    def isAnagram(self, s, t):
        return (sorted(s)== sorted(t))


def test(strings, expectedResult):
    sol = Solution()
    actualResult = sol.groupAnagrams(strings)
    print(actualResult)
    print(actualResult == expectedResult)


strs = ["eat","tea","tan","ate","nat","bat", "an", "na"]
result = [["bat"],["nat","tan"],["ate","eat","tea"]]
test(strs, result)

strs = [""]
result = [[""]]
test(strs, result)

strs = ["a"]
result = [["a"]]
test(strs, result)
