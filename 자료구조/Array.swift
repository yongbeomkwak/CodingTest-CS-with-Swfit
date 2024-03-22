

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

func rotate(_ x:Int,_ y: Int,_ h:Int,_ w:Int,_ rotateCnt: Int,_ isCounter: Bool) {
    
    /*
     
     (x,y) : 좌측 위 (세로,가로)
     h: 높이
     w: 가로
     rotateCnt: 회전 횟수
     isCounter: 반시계 여부 (true(반)/false(시계))
     */

    
    let loopCounter = min(x+h,y+w)/2 // 전체부터 내부까지 돌릴 횟수
        
    for l in 0..<loopCounter { // l = 현재 가장 바깥 사각형을 가르킴
        var tmp = [Int]()
        let left = y+l // 회전 사각형 좌측
        let top = x+l // 회전 사각형 상단
        let rihgt = y+w-1-l //회전 사각형 오측
        let bottom = x+h-1-l //회전 사각형 하단
        
        // 상단 left ~ right 전까지
        for i in stride(from: left, to: rihgt, by: 1) {
            tmp.append(board[top][i])
        }
        
        // 우측 top ~ bottom 전까지
        for i in stride(from: top, to: bottom, by: 1) {
            tmp.append(board[i][rihgt])
        }
        
        // 하단 right ~ left 전까지
        for i in stride(from: rihgt, to: left, by: -1) {
            tmp.append(board[bottom][i])
        }
        
        // 좌측 bottom ~ top 전까지
        for i in stride(from: bottom, to: top, by: -1) {
            tmp.append(board[i][left])
        }
        
        let len = tmp.count
        
        if len == 0 { // 1개짜리는 회전할 필요 없음
            break
        }
        
        let move = rotateCnt%len // 움직일 칸
        
        // 반시계의 기준 =. move , 시계 기준 = len-move
        tmp = isCounter ?  Array(tmp[move..<len] + tmp[0..<move]) : Array(tmp[len-move..<len] + tmp[0..<len-move])
        
        var k = 0
        
        for i in stride(from: left, to: rihgt, by: 1) {
            board[top][i] =  tmp[k]
            k += 1
        }
        
        for i in stride(from: top, to: bottom, by: 1) {
            board[i][rihgt] =  tmp[k]
            k += 1
        }
        
        for i in stride(from: rihgt, to: left, by: -1) {
            board[bottom][i] = tmp[k]
            k += 1
        }
        
        for i in stride(from: bottom, to: top, by: -1) {
            board[i][left] = tmp[k]
            k += 1
        }
        
        
        
        
    }
    
}