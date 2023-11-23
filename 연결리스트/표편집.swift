import Foundation

struct Row {
    
    let data: Int
    var prev,next:Int
    var isExisted: Bool 
    
    init (_ data: Int, _ prev: Int, _ next: Int){
        self.data = data
        self.prev = prev
        self.next = next
        isExisted = true
    }
    
}


var linkedList: [Row] = []
var deletedRow: [Row] = []
var cur: Int = 0


func funcU(_ x:Int){
    
    for _ in 0..<x {
        cur = linkedList[cur].prev
    }
}

func funcD(_ x:Int){
    
    for _ in 0..<x {
        cur = linkedList[cur].next
    }
}

func funcC(){
    
    let prev = linkedList[cur].prev
    let next = linkedList[cur].next

    if prev != -1{ // 범위 벗어나지 않았으면 
        linkedList[prev].next = next  // 이전의 다음은 현재의 다음
    }
    
    if next != -1 {  // 범위 벗어나지 않았으면
        linkedList[next].prev = prev // 다음의 이전꺼는 현재의 이전
    }
    
    linkedList[cur].isExisted = false //지금은 지워 
    deletedRow.append(linkedList[cur]) // 삭제 배열에 추가 
    cur = next == -1 ? prev : next // 커서를 next 범위가 벗어나면 , 이전꺼 , 아니면 다음으로 
}

func funcZ() {
    
    let restoreRow = deletedRow.removeLast().data // 복원 
    
    linkedList[restoreRow].isExisted = true // 복원 
    let prev = linkedList[restoreRow].prev 
    let next = linkedList[restoreRow].next
    if prev != -1 { linkedList[prev].next = restoreRow } // 이전 노드 연결
    if next != -1 { linkedList[next].prev = restoreRow } // 다음 노드 연결
    
}


func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    cur = k
    
    for i in 0..<n {
        
        if i == n-1 {
            linkedList.append(Row(i,i-1,-1)) // next = -1 
        }
        
        else {
            linkedList.append(Row(i,i-1,i+1)) 
        }
        
    }
    
    var result = [String](repeating:"O",count: n)
    

    for c in cmd {
        
        let s = c.split{$0 == " "}.map{String($0)}
        
        if s[0] == "D" {
            
            let x = Int(s[1])!
            funcD(x)
            
            
        } else if s[0] == "U" {
            
            let x = Int(s[1])!
            funcU(x)
     
            
        } else if s[0] == "C" { //제거
            funcC()
        } else { //Z
            funcZ()
        }
        
    }
    
    for row in deletedRow { // 복원되지 않은 애들 X로 
        result[row.data] = "X"
    }
    
    return result.joined()
}