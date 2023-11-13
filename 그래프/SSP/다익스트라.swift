struct Edge{
    let start:Int
    let cost:Int
    
  
    public static func <=(lhs:Self,rhs:Self) -> Bool {
        return rhs.cost <= lhs.cost
    }
}


struct Heap<T>{
    
    var nodes:[T] = []
    var comparer:(T,T) -> Bool
    
    var isEmpty:Bool {
        return nodes.isEmpty
    }
    
    var top:T? {
        return nodes.first
    }
    
    var count:Int {
        return nodes.count
    }
    
    init(comparer: @escaping (T,T) -> Bool ){
        self.comparer = comparer
    }
    
    
    mutating func push(_ element:T){
        
        nodes.append(element)
        
        var index:Int = nodes.count-1
        
        
        while index > 0 && !comparer(nodes[index],nodes[(index-1)/2]) {
            
            let parent = (index-1)/2
            nodes.swapAt(index, parent)
            index = parent
            
        
        }
        
    }
    
    mutating func pop() ->T? {
        
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.popLast()
        }
        
        
        nodes.swapAt(0, nodes.count - 1)
        
        let result = nodes.popLast()
        
        var index:Int = 0
        
        
        while index < nodes.count {
            
            let left:Int = index * 2+1
            let right:Int = left+1
            
            
            if right < nodes.count {
                
                if comparer(nodes[left],nodes[right]) && !comparer(nodes[right],nodes[index]) {
                    
                    nodes.swapAt(right, index)
                    index = right
                    
                }
                
                else if !comparer(nodes[left],nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                }
                
                else {
                    break
                }
                
            }
            
            else if left < nodes.count {
                if !comparer(nodes[left],nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                }
                else {
                    break
                }
            }
            else {
                break
            }
            
        }
        
        
        return result
    }
    
    
}

let ve = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}

let v = ve[0]
let e = ve[1]
let k = Int(readLine()!)!

var heap = Heap<Edge>(comparer: <=)
var dist:[Int] = [Int](repeating:Int.max,count:v+1)
var adj:[[(Int,Int)]] = [[(Int,Int)]](repeating:[],count:v+1)

for _ in 0..<e {
    let uvw = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}
    
    adj[uvw[0]].append((uvw[1],uvw[2]))
    
}

dist[k] = 0
heap.push(Edge(start: k, cost: 0))

while !heap.isEmpty {
    
    let top = heap.pop()!
    
    
    for nxt in adj[top.start] {
        
        if dist[nxt.0] > top.cost + nxt.1{
            dist[nxt.0] = top.cost + nxt.1
            
            heap.push(Edge(start: nxt.0, cost: dist[nxt.0]))
        }
        
    }
}


for i in 1...v {
    print(dist[i] != Int.max ? dist[i] : "INF")
}


