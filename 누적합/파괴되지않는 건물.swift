import Foundation

func effect (_ degreeResult: inout [[Int]], _ skill:[Int]) {
    
    let r1 = skill[1]
    let c1 = skill[2]
    let r2 = skill[3]
    let c2 = skill[4]
    let degree = skill[0] == 1 ? -skill[5] : skill[5]
    
    /*
     이팩트가 가해지는 범위
     r1 = 1 , r2 = 2
     c1 = 1 , c2 = 2 일 때
     d = degree
    
        0  1  2  3
    
    0           
    
    1      d     -d
    
    2      
    
    3      -d     d
    
    
       
    */
    
    degreeResult[r1][c1] += degree
    degreeResult[r2+1][c2+1] += degree  
    degreeResult[r2+1][c1] -= degree
    degreeResult[r1][c2+1] -= degree 
    
}

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {

    /// type: 1(적), 2(아군)
    /// r1 -> r2 , c1 -> c2
    /// degree -> amount
    
    var board = board
    let n = board.count
    let m = board[0].count
    
    var degreeResult: [[Int]] = [[Int]](repeating:[Int](repeating:0,count:m+1), count: n+1)
    
    
    for _skill in skill {
        
        effect(&degreeResult, _skill)
    }
    
    
    for r in 0..<n {
        for c in 1...m {
            degreeResult[r][c] += degreeResult[r][c-1]
        } 
    }
    //가로 누적합
    
    for c in 0..<m {
        for r in 1...n {
            
            degreeResult[r][c] += degreeResult[r-1][c]
        }
    }
    
    //세로 누적합
    
    var result: Int = 0
    
    for r in 0..<n {
        for c in 0..<m {
        
            if board[r][c] + degreeResult[r][c] > 0 { 
                result += 1
            }
            
        }
    }
    
    
    return result
}

//https://velog.io/@thguss/프로그래머스-L3-파괴되지-않은-건물