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
        for i in 0..<elements.count {
            Rcombi(i + 1, now + [elements[i]])
        }
    }
    Rcombi(0, [])
    return result
}