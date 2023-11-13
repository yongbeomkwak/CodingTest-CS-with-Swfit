import Foundation

let n = Int(readLine()!)!

var adj:[[Int]] = []


for _ in 0..<n {
    let arr = readLine()!.split{$0 == " "}.compactMap{Int(String($0))!}
    adj.append(arr)
}


for k in 0..<n{
    for i in 0..<n{
        for j in 0..<n{
            if adj[i][k] == 1 && adj[k][j] == 1 {
                adj[i][j] = 1
            }
        }
    }
}


for i in 0..<n{
    print(adj[i].compactMap({String($0)}).joined(separator: " "))
}
