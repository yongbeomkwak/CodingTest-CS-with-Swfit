

.joined()

result.joined(separator: " ")

append(contentsOf:):  Sequence 혹은 Collection의 원소들을 사용할 수 있다. 
(배열의 아니라 Seqeuence인 점에 주목하라) 즉 배열 뿐만아니라 다른 배열의 조각(ArraySlice)이나 
Set 심지어는 원소 타입만 맞으면 셀 수 있는 범위값도 들어갈 수 있다.



arr.enumerated(): (offset,element) 튜플을 리턴 


arr.reduce(into:초기값){
    $0(초깃값) + $1(arr의 요소) 
}

arr.firstIndex(of: _elements.max()!): 왼쪽부터 최댓값 인덱스 접근 


arr.remove(at:0) : 0번 째 인덱스 제거 및 리턴 

var numbers = [1, 2, 3, 4, 5]
numbers.insert(100, at: 3)
numbers.insert(200, at: numbers.endIndex)


print(numbers)
// Prints "[1, 2, 3, 100, 4, 5, 200]"//100을 3인덱스에

// N x N  90도 회전
// after[i][j] = before[n-j-1][i]

var arr = [[1,2,3],[4,5,6],[7,8,9]]


var rotate = [[0,0,0],[0,0,0],[0,0,0]]

let n = 3

for i in 0..<3 {
    for j in 0..<3 {
        rotate[i][j] = arr[n-j-1][i];
    }
}

for i in 0..<n {
    print(rotate[i])
}

// 시계 및 반 시계 방향 회전 

/// rotate(시작 행,시작 열,높이,너비,회전횟수,반시계 방향 여부)
func rotate(_ r: Int,_ c: Int,_ h:Int, _ w:Int,_ roateCnt: Int,isCounter:Bool) {
    
    
    let loopCount = min(r+h,c+w)/2
    
    
    
    for loop in 0..<loopCount { // 루프는 현재 가르키고 있는 태두리와 같다
        
        var tmp = [Int]()
        
        let endOfRight = c+w-loop-1
        let endOfBottom = r+h-loop-1
        
        for i in loop..<endOfRight { // 루프의 가장위 가로 담기
            tmp.append(arr[loop][i])
        }
      
        for i in loop..<endOfBottom {
            tmp.append(arr[i][endOfRight]) // 오른쪽 끝 세로 담기
        }
    
        // 아래쪽 끝을 오른쪽부터 담기
        for i in stride(from: endOfRight-1, through:loop, by: -1) {
            tmp.append(arr[endOfBottom][i+1])
        }
        
        //왼쪽 끝을 아래부터 담기
        for i in stride(from: endOfBottom-1, through: loop, by: -1) {
            tmp.append(arr[i+1][loop])
        }
        
        
        let len = tmp.count
        let move = roateCnt%len
        
        tmp = isCounter ?  Array(tmp[move..<len] + tmp[0..<move]) : Array(tmp[len-move..<len] + tmp[0..<len-move])
        
        var k = 0
        
        
        for i in loop..<endOfRight { // 루프의 가장위 가로 담기
            arr[loop][i] = tmp[k]
            k+=1
        }
      
        for i in loop..<endOfBottom {
            arr[i][endOfRight] = tmp[k] // 오른쪽 끝 세로 담기
            k+=1
        }
        
        
        // 아래쪽 끝을 오른쪽부터 담기
        for i in stride(from: endOfRight-1, through:loop, by: -1) {
            arr[endOfBottom][i+1] = tmp[k]
            k+=1
        }
        
        //왼쪽 끝을 아래부터 담기
        for i in stride(from: endOfBottom-1, through: loop, by: -1) {
            arr[i+1][loop] = tmp[k]
            k+=1
        }
        
        
    }
    
    
}