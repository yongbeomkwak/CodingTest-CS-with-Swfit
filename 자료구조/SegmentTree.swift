import Foundation


// a: 배열 a
// tree: 세그먼트 트리
// node: 세그먼트 트리 노드 번호
// node가 담당하는 합의 범위가 start ~ end]


let nmk = readLine()!.split{$0 == " "}.map{Int($0)!}

let (n,m,k) = (nmk[0],nmk[1],nmk[2])

let height = Int(ceil(log2(Double(n))))

//N이 2의 제곱꼴이 아닌 경우에는 높이가 H = lgN
// 총 세그먼트 트리를 만드는데 필요한 배열의 크기는 2^(H+1) - 1개가 됩니다.

var tree = [Int64](repeating: 0, count: 1 << (height+1))


var arr: [Int64] = []

for _ in 0..<n {
    arr.append(Int64(readLine()!)!)
}

func makeTree(_ tree: inout [Int64],_ node: Int,_ start:Int,_ end: Int) -> Int64 {
    
    if start == end { // 리프 노드 , 리프 노드는 배열의 그 위치의 원소
        tree[node] = arr[start]
        return arr[start]
    } else {
        
        // node*2 = 왼쪽 자식
        // node *2 +1 = 오른쪽자식
        // 담당구역이 start~ end = start ~ (start+end)/2  + (start+end)/2+1 ~ end
        tree[node] = makeTree(&tree, node*2, start, (start+end)/2) + makeTree(&tree, node*2+1, (start+end)/2+1, end)
        
        return tree[node]
        
    }
    
}


func sum(_ tree: inout [Int64],_ node: Int,_ start:Int,_ end: Int,_ left:Int, _ right: Int) -> Int64 {
    
    /*
     node가 담당하고 있는 구간이 [start,end] 이고, 합을 구해야하는 구간이 [left,right]
     이라면 다음과 같이 4가지 경우로 나누어질 수 있습니다.
     */
    
    /*
     1. [left,right]와 [start,end]가 겹치지 않는 경우
     left > end는 [start,end] 뒤에 [left,right]가 있는 경우이고,
     right < start는 [start,end] 앞에 [left,right]가 있는 경우입니다. 이 경우에는 겹치지 않기 때문에, 더 이상 탐색을 이어나갈 필요가 없습니다. 따라서 0을 리턴해 탐색을 종료합니다.
     
     */
    if left > end || right < start {
        return 0
    }
    
    /*
     2. [left,right]가 [start,end]를 완전히 포함하는 경우
     
     이 경우도 더 이상 탐색을 이어나갈 필요가 없습니다.
     구해야하는 합의 범위는 [left,right]인데,
     [start,end]는 그 범위에 모두 포함되고,
     그 node의 자식도 모두 포함되기 때문에 더 이상 호출을 하는 것은 비효율적입니다.
     따라서, tree[node]를 리턴해 탐색을 종료합니다.
     
     */
    
    if left <= start && end <= right {
        return tree[node]
    }
    
    /*
    3. [start,end]가 [left,right]를 완전히 포함하는 경우
    4. [left,right]와 [start,end]가 겹쳐져 있는 경우 (1, 2, 3 제외한 나머지 경우)
     
     3번과 4번의 경우에는 왼쪽 자식과 오른쪽 자식을 루트로 하는 트리에서 다시 탐색을 시작해야 합니다.
    */
    return sum(&tree, node*2, start, (start+end)/2, left, right) + sum(&tree, node*2+1, (start+end)/2+1, end, left, right)
    
}

func update(_ tree: inout [Int64],_ node: Int,_ start:Int,_ end: Int,_ index: Int,_ diff: Int64) {
    
    /*
     index번째 수를 val로 변경한다면, 그 수가 얼마만큼 변했는지를 알아야 합니다. 이 수를 diff라고 하면
     diff = val - arr[index]로 쉽게 구할 수 있습니다.
     
     수 변경은 2가지 경우가 있습니다.

     1. [start,end]에 index가 포함되는 경우
     2. [start,end]에 index가 포함되지 않는 경우
     
     node의 구간에 포함되는 경우에는 diff만큼 증가시켜 합을 변경해 줄 수 있습니다.
     tree[node] = tree[node] + diff 포함되지 않는 경우는 그 자식도 index가 포함되지 않기 때문에, 탐색을 중단해야 합니다.
     
     
     */
    
    if index < start || index > end {
        return
    }
    tree[node] = tree[node] + diff
    
    if start != end { // 리프 노드가 아닌 경우에는 자식도 변경해줘야 하기 때문에, start != end로 리프 노드인지 검사를 해야 합니다.
        update(&tree,node*2, start, (start+end)/2, index, diff);
        update(&tree,node*2+1, (start+end)/2+1, end, index, diff);
    }
    
}



makeTree(&tree, 1, 0, n-1)

for _ in 0..<m+k {
    
    let input = readLine()!.split{$0 == " "}.map{Int64($0)!}
    
    let t2 = Int(input[1])
    let t3 = input[2]
    
    if input[0] == 1 {
        
        let diff : Int64 = t3 - arr[t2-1]
        arr[t2-1] = t3
        
        update(&tree, 1, 0, n-1, t2-1, diff)

        
    } else {
        
        print(sum(&tree, 1, 0, n-1, t2-1, Int(t3-1)))
        
    }
    
}
// https://book.acmicpc.net/ds/segment-tree