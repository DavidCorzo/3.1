

def decbin(n):
    a = []
    while(n > 0):
        dig = n % 2
        a.append(dig)
        n = n // 2
    a.reverse()
    s = "".join([str(x) for x in a])
    return s

def bindec(s):
    return int(s, 2)

def shift(arr):
    s = '0'
    for i in arr[1:len(arr)-1]:
        s += i
    return '0' + s

def cycle(A,B,Q,C):
    if ( Q[-1] == "1" ):
        print(bindec(A), bindec(B), bindec(A)+bindec(B))
        A = decbin(bindec(A) + bindec(B)).rjust(WIDTH, PADDING)
        
    return A,B,Q,C

WIDTH = 32
PADDING = '0'
A = ''.rjust(WIDTH, PADDING)
B = decbin(56_452).rjust(WIDTH, PADDING)
Q = decbin(9).rjust(WIDTH, PADDING)
C = PADDING
for i in range(32):
    A,B,Q,C = cycle(A,B,Q,C)
    print(shift(A))
    break
    if i == 2:
        break
