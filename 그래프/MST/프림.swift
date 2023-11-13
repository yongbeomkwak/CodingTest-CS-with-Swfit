//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 11/13/23.
//

import Foundation

import Foundation

struct Edge {
    
    let end: Int
    let weight: Int
    
    init(_ end: Int, _ weight: Int) {
        self.end = end
        self.weight = weight
    }
    
    public static func <= (lhs:Self,rhs:Self) -> Bool {
     
        return lhs.weight >= rhs.weight // 우선순위 큐에서 위에 있기위해
        
    }
}


public struct Heap<T> {
    // 전체 노드
    var nodes: [T] = []
    // 비교 연산자
    let comparer: (T,T) -> Bool

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    // 예를 들어, Heap<Int>(comparer: >=) 는 Min Heap
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }

    // top 반환
    func top() -> T? {
        return nodes.first
    }

    // 삽입
    mutating func push(_ element: T) {
        

        nodes.append(element)

        var index = nodes.count - 1 //마지막 원소 가르킴 (현재 들어간 원소)

        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) { // 부모와 비교 후 정렬 기준에 맞지 않으면 swap

            let parent:Int = (index-1)/2

            nodes.swapAt(index, parent)
            index = parent
        }
    }

    // 삭제
    mutating func pop() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }

        if nodes.count == 1 {
            return nodes.removeLast()
        }

      
        nodes.swapAt(0, nodes.count-1) //꺼낼 top을 마지막이랑  swap 후
        let result = nodes.popLast() // 꺼냄

        var index = 0

        //Heapify
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1

            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                    !comparer(nodes[right], nodes[index]) { //오른쪽과 index가 순서가 안 맞을 때
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]){ // left와 index가 순서가 안 맞을 때
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }

        return result
    }
}


let n = readLine()!.split{$0 == " "}.compactMap({Int(String($0))!})

let nv = n[0]
let ne = n[1]

var dist: [Int] = [Int] (repeating: Int.max, count: nv+1)

var heap = Heap<Edge>(comparer: <=)

var graph:[[Edge]] = [[Edge]](repeating: [], count: nv+1)


for _ in 0..<ne {
    
    let info = readLine()!.split{$0 == " "}.compactMap({Int(String($0))!})
    
    graph[info[0]].append(Edge(info[1], info[2]))
    graph[info[1]].append(Edge(info[0], info[2]))
}


var answer: Int = 0

var visited:[Bool] = [Bool](repeating: false, count: nv+1)





heap.push(Edge(1, 0))


while !heap.isEmpty {
 
    let top = heap.pop()!
    if visited[top.end] {
        continue
    }
    

    visited[top.end] = true
    
    answer += top.weight
    
    
    for edge in  graph[top.end] {
        
        let next = edge.end
        
        if !visited[next] {
            heap.push(edge)
        }
        
    }
    
}

print(answer)

