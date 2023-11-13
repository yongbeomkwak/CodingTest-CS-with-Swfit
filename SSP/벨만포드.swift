import Foundation


let nm = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}
let n = nm[0]
let m = nm[1]


var dist:[Int] = [Int](repeating:Int.max,count:n+1)
var isCycle:Bool = false
var adj:[[(Int,Int)]] = [[(Int,Int)]](repeating:[],count:n+1)


for _ in 0..<m {
    let abc:[Int] = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}
    let a = abc[0]
    let b = abc[1]
    let c = abc[2]
    
    adj[a].append((b,c))
    
}


func bellman(_ start:Int){
    
    dist[start] = 0
    
    for _  in 0..<n{
        
        for u in 1...n {
            
            if dist[u] == Int.max {
                continue
            }
            
            for nxt in adj[u] {
                
                if dist[nxt.0] > dist[u] + nxt.1 {
                    dist[nxt.0] = dist[u] + nxt.1
                }
                
            }
        }
        
    }
    
    
    for _  in 0..<n{
        
        for u in 1...n {
            
            if dist[u] == Int.max {
                continue
            }
            
            for nxt in adj[u] {
                
                if dist[nxt.0] > dist[u] + nxt.1 {
                    isCycle = true
                }
                
            }
        }
        
    }
    
}

bellman(1)

if isCycle {
    print(-1)
}

else {
    for i in 2...n{
        if dist[i] == Int.max{
            print(-1)
        }

        else{
            print(dist[i])
        }
    }
}
