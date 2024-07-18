import copy
from typing import List


class Solution:

    def encode(self, strs: List[str]) -> str:
        encoded_string = ""
        for word in strs:
            word_count = len(word)
            encoded_string += f"{word_count}#{word}"
        return encoded_string

    def decode(self, input_str: str) -> List[str]:
        working_str = copy.deepcopy(input_str)
        output_strs = []
        next_word = ''
        next_word_len = ''
        while len(working_str) > 0:
            letter = working_str[0]
            if next_word == '':
                if letter != "#":
                    next_word_len += letter
                    working_str = working_str[1:]
                else:
                    next_word_len = int(next_word_len)
                    working_str = working_str[1:]
                    for i in range(next_word_len):
                        next_word += working_str[i]
                    working_str = working_str[next_word_len:]
                    output_strs.append(next_word)
                    next_word = ''
                    next_word_len = ''
        return output_strs


def test(strs):
    sol = Solution()
    enc_str = sol.encode(strs)
    print (f"Encoded: {enc_str}", end=' | ')
    dec_str = sol.decode(enc_str)
    print (f"Decoded: {dec_str}")
    print(dec_str == strs)

test(["neet","code","love","you"])
test(["we","say",":","yes"])
test([])
test([""])
test([' '])
test(['m'])
test(["The quick brown fox","jumps over the","lazy dog","1234567890","abcdefghijklmnopqrstuvwxyz"])