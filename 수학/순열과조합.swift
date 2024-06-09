// 순열

func permutation<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    var visited = [Bool](repeating: false, count: elements.count)
    
    func permut(_ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in 0..<elements.count {
            if visited[i] == true { continue }
            visited[i] = true
            permut(now + [elements[i]])
            visited[i] = false
        }
    }
    permut([])
    return result
}

let arr = [1, 2, 3, 4]
let permu = permutation(arr, 3)


// 조합 
// nCr
func combination<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    
    func combi(_ index: Int, _ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        for i in index..<elements.count {
            combi(i + 1, now + [elements[i]])
        }
    }
    combi(0, [])
    return result
}

let arr = [1, 2, 3, 4]
let combi = combination(arr, 3)
    

// 중복 순열  nPIr
func Rpermutation<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    
    func Rpermut(_ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in 0..<elements.count {
            Rpermut(now + [elements[i]])
        }
    }
    Rpermut([])
    return result
}

// 중복 조합
// nHr
func Rcombination<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    
    func Rcombi(_ index: Int, _ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        for i in index..<elements.count {
            Rcombi(i, now + [elements[i]])
        }
    }
    Rcombi(0, [])
    return result
}


// 다음 순열 조사

func nextPermutation<T: Comparable>(_ arr:[T]) -> [T] {
    
    var arr = arr
    var i: Int = arr.count-1 // 오른쪽 끝부터
    
    while i > 0 && arr[i-1] >= arr[i] { // A[i-1] < A[i] 를 만족하는 가장 큰 인덱스를 찾음
        i -= 1
    }
    
    // 이미 arr이 가장 마지막 상태 (오름차순 완성)
    if i <= 0 {

        return arr
    }
        
    var j = arr.count-1
    
    // i = A[i-1] < A[i] 를 만족하는 가장 큰 인덱스, 즉 idx-1이 실질적으로 j와 바뀔놈
    
    while arr[i-1] >= arr[j] { // idx-1과 가장 비슷하게 큰 j를 찾음
        j -= 1
    }
    
    // 1  3  6  5  4  1
    //   i-1 i     j
    
    arr.swapAt(i-1, j) // 스왑
    

    // 앞에꺼는 그대로, 뒤에거는 오름차순 정렬
    return Array(arr[0..<i] + arr[i..<arr.count].sorted())
}
