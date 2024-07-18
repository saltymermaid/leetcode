class MinStack:

    def __init__(self):
        self.stack = []
        self.min = None

    def push(self, val: int) -> None:
        self.stack.append((val, self.min))
        if self.min == None or val < self.min:
          self.min = val
        return None

    def pop(self) -> None:
        pop_val = self.stack.pop()
        self.min = pop_val[1]
        return pop_val[0]

    def top(self) -> int:
        return self.stack[-1][0]

    def getMin(self) -> int:
        return self.min
    

def test(calls, vals, expected_result):
    results = []
    for i in range(len(calls)):
        func = calls[i]
        if func == "MinStack":
            minStack = MinStack()
            results.append(None)
        elif func == "push":
            results.append(minStack.push(vals[i][0]))
        elif func == "pop":
            minStack.pop()
            results.append(None)
        elif func == "top":
            results.append(minStack.top())
        elif func == "getMin":
            results.append(minStack.getMin())
        print(f"Function: {func}, Value: {vals[i]}, Result: {results}, MinStack: {minStack.stack} | Min: {minStack.min}")
    print(results)
    return results == expected_result


calls = ["MinStack","push","push","push","getMin","pop","top","getMin"]
vals = [[],[-2],[0],[-3],[],[],[],[]]
expected_result = [None, None, None, None, -3, None, 0, -2]
print(test(calls, vals, expected_result))

# Explanation
# MinStack minStack = new MinStack();
# minStack.push(-2);
# minStack.push(0);
# minStack.push(-3);
# minStack.getMin(); // return -3
# minStack.pop();
# minStack.top();    // return 0
# minStack.getMin(); // return -2


# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()