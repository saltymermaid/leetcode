from collections import defaultdict
from typing import List

NUM_ROWS_COLS = 9

class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        rows = defaultdict(set)
        cols = defaultdict(set)
        squares = defaultdict(set)

        for i in range(NUM_ROWS_COLS):
            for j in range(NUM_ROWS_COLS):
                if board[i][j] == ".":
                    continue
                if (board[i][j] in rows[i] or
                    board[i][j] in cols[j] or
                    board[i][j] in squares[(i // 3, j // 3)]):
                    return False
                rows[i].add(board[i][j])
                cols[j].add(board[i][j])
                squares[(i // 3, j // 3)].add(board[i][j])
        return True

    # def isValidSudoku(self, board: List[List[str]]) -> bool:
    #     for row in board:
    #         if not self.validateNine(row):
    #             return False
    #     cols = []
    #     for i in range(9):
    #         cols.append([])
    #         for j in range(9):
    #             cols[i].append(board[j][i])
    #     for col in cols:
    #         if not self.validateNine(col):
    #             return False
    #     boxes = [[] for _ in range(9)]
    #     for i in range(9):
    #         for j in range(9):
    #             x = i // 3
    #             y = (j // 3) * 3
    #             boxes[x + y].append(board[i][j])
    #     for box in boxes:
    #         if not self.validateNine(box):
    #             return False
    #     return True
    
    # def validateNine(self, nine: List[str]) -> bool:
    #     total_nums = 0
    #     for spot in nine:
    #         if (spot != "."):
    #             total_nums += 1
    #     total_unique = set(nine)
    #     return total_nums == len(total_unique) - 1
    
def test(board, expected_result):
    sol = Solution()
    print (sol.isValidSudoku(board) == expected_result)

board = [
    ["1","2",".",".","3",".",".",".","."],
    ["4",".",".","5",".",".",".",".","."],
    [".","9","1",".",".",".",".",".","3"],
    ["5",".",".",".","6",".",".",".","4"],
    [".",".",".","8",".","3",".",".","5"],
    ["7",".",".",".","2",".",".",".","6"],
    [".",".",".",".",".",".","2",".","."],
    [".",".",".","4","1","9",".",".","8"],
    [".",".",".",".","8",".",".","7","9"]
]
test(board, False)

board = [
    ["1","2",".",".","3",".",".",".","."],
    ["4",".",".","5",".",".",".",".","."],
    [".","9","8",".",".",".",".",".","3"],
    ["5",".",".",".","6",".",".",".","4"],
    [".",".",".","8",".","3",".",".","5"],
    ["7",".",".",".","2",".",".",".","6"],
    [".",".",".",".",".",".","2",".","."],
    [".",".",".","4","1","9",".",".","8"],
    [".",".",".",".","8",".",".","7","9"]
]
test(board, True)