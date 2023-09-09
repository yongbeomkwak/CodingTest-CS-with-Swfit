import Foundation

let x: Int = 5
let sqrtX = sqrt(Double(x))		// 제곱근
let powX = pow(Double(x), 2)	// 제곱

print(Int(sqrtX))	// 2
print(powX)			// 25.0


1. 반올림(round)
소수점이 5보다 크거나 같으면 올리고, 5보다작으면 내립니다. 소수점 자릿수에 대한 지정이 없는 경우 첫 번째 자리로 판단됩니다.

round(5.123)  // 5.0
round(5.456)  // 5.0
round(5.512)  // 6.0
round(5.567)  // 6.0
round(5.657)  // 6.0
round(5.765)  // 6.0
round(-3.453) // -3.0
round(-3.658) // -4.0
2. 올림(ceil)
소수점이 0보다 큰 경우 무조건 올립니다. 소수점을 올리면 정수부가 1 더해지고 소수점은 0이 됩니다.

ceil(5.123)  // 6.0
ceil(5.456)  // 6.0
ceil(5.512)  // 6.0
ceil(5.567)  // 6.0
ceil(5.657)  // 6.0
ceil(5.765)  // 6.0
ceil(-3.453) // -3.0
ceil(-3.658) // -3.0
 

3. 내림(floor)
소수점을 무조건 내립니다. 

floor(5.123)  // 5.0
floor(5.456)  // 5.0
floor(5.512)  // 5.0
floor(5.567)  // 5.0
floor(5.657)  // 5.0
floor(5.765)  // 5.0
floor(-3.453) // -4.0
floor(-3.658) // -4.0



// 조합 

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