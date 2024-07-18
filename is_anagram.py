class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        if len(s) != len(t):
            return False
        letterMap = {}
        for l in s:
            letter = l.lower()
            if letter not in letterMap:
                letterMap[letter] = 1
            else:
                letterMap[letter] += 1
        for l in t:
            letter = l.lower()
            if letter not in letterMap:
                return False
            if letterMap[letter] > 1:
                letterMap[letter] -= 1
            else:
                del letterMap[letter]
        return len(letterMap) == 0

def test(source, target, expected_result):
    solution = Solution()
    print (solution.isAnagram(source, target) == expected_result)

test('anagram', 'nagaram', True)
test('rat', 'car', False)
test('bonobo', 'oobbnn', False)
test('Pustulent Trash Fire', 'erif hsart tnelutsup', True)