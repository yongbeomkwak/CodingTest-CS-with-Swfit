//
//  main.swift
//  terminal
//
//  Created by yongbeomkwak on 11/13/23.
//

import Foundation

let nm = readLine()!.split{$0 == " "}.compactMap{Int($0)!}
let n = nm[0]
let m = nm[1]

var board:[[Int]] = [[Int](repeating: 0, count: n + 1)]

for i in 1...n {
    let arr = readLine()!.split{$0 == " "}.compactMap{Int($0)!}
    
    board.append([0] + arr)
        
}




// 누적합 board[i][j] += board[i][j-1] + board[i-1][j]  - board[i-1][j-1] //  현재 누적합 = 현재 값 + 이전 가로 누적합 + 이전 세로 누적합 -  이전 가로세로 누적합(중복값 제거를 위해)
for i in 1...n {
    for j in 1...n {
        
        board[i][j] += board[i][j-1] + board[i-1][j] - board[i-1][j-1]
    }
}


for _ in 0..<m {
    let arr = readLine()!.split{$0 == " "}.compactMap{Int($0)!}
    
    let x1 = arr[0]
    let y1 = arr[1]
    let x2 = arr[2]
    let y2 = arr[3]
    
  // 해당 범위의 합: board[x2][y2] - board[x1-1][y2] - board[x2][y1-1] + board[x1-1][y1-1] = 끝 누적값  - (시작보다 하나 전 가로 누적값) - (시작보다 하나 전 세로 누적값) + 시작 전 가로세로 누적값 ( 앞의 두개의 차감에 중복으로 빠진 값을 더해줌
   print(board[x2][y2] - board[x1-1][y2] - board[x2][y1-1] + board[x1-1][y1-1])
}


// 참고자료: https://dev-mandos.tistory.com/226
