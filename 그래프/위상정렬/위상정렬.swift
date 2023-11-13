//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 11/13/23.
//

import Foundation

let input1 = readLine()!.split{$0 == " "}.compactMap{Int($0)!}

let n = input1[0]
let m = input1[1]

var edges: [Int] = [Int](repeating: 0 , count: n+1)

var adj:[[Int]] = .init(repeating: [], count: n+1)

for _ in 0..<m {
    let input2 = readLine()!.split{$0 == " "}.compactMap{Int($0)!}
    
    let a = input2[0] // 앞에 있어야 하는 학생
    
    let b = input2[1]
    
    edges[b] += 1
    
    adj[a].append(b) // a에 위치에 영향을 받는 학생 들
}


struct Queue<T> {
    var enque: [T]
    
    var deque: [T] = []
    
    init(enque: [T]) {
        self.enque = enque
    }
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    var front: T? {
        
        if deque.isEmpty {
            enque.first
        }
        
        return deque.last
        
    }
    
    mutating func push(_ element:T) {
        enque.append(element)
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.popLast()
    }
    
}

var q = Queue<Int>(enque: [])

var ans: [Int] = []

for i in 1...n {
    
    if edges[i] == 0 {
        q.push(i)
        ans.append(i)
    }
    
}


while !q.isEmpty {
    
    let top = q.pop()!
    
    for next in adj[top] {
                
       edges[next] -= 1
        
        if edges[next] == 0 {
            q.push(next)
            ans.append(next)
        }
        
    }
    
}

print(ans.map{String($0)}.joined(separator: " "))







