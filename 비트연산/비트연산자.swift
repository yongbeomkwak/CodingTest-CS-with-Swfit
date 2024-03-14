// 100
print(4.nonzeroBitCount) // 1의 개수 1
print(4.bitWidth) // 64 bit
print(4.leadingZeroBitCount) // 1 왼쪽에 있는 0개수  bitWidth - trailingZeroBitCount - nonzeroBitCount   =  64 -1 -2 = 61
print(4.trailingZeroBitCount) // 1오른쪽에 있는 0개수 = 2


// 특정 n 비트 자릿수 맞추기
var a = 3 
print(3 &= (1<<n+1)-1) // n+1만큼 옮긴후 -1을 하면 1~n자리까지 모두 1이 됨 그 다음 & 연산하면 n자리 비트가 됨

// 특정 n자리 비트 0으로 바꾸기


        
let bit = 1 << n
        
x &= ~bit
