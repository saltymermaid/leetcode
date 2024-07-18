OPEN_BRACKETS = ['(','{','[']
CLOSED_BRACKETS = [')', '}', ']']

class Solution:

    def isValid(self, s: str) -> bool:
        open = []
        for brace in s:
            if brace in OPEN_BRACKETS:
                open.append(OPEN_BRACKETS.index(brace))
            elif brace in CLOSED_BRACKETS and len(open) > 0:
                brace_index = CLOSED_BRACKETS.index(brace)
                if brace_index == open[-1]:
                    open.pop(-1)
                else:
                    return False
            else:
                return False
        return len(open) == 0


def test(input_string, expected_result):
    sol = Solution()
    return sol.isValid(input_string) == expected_result


s = "()"
print(test(s, True))

s = "()[]{}"
print(test(s, True))

s = "([{}])"
print(test(s, True))

s = "(]"
print(test(s, False))

s = "("
print(test(s, False))

s = "]"
print(test(s, False))

s = ""
print(test(s, True))