//defaultDict
//딕셔너리에 없는 값을 조회할 경우 디폴트값을 설정할 수 있다.

let myDict = ["a" : 1, "b" : 2, "c" : 3]

print(myDict["d", default: -1])

// 1. Key 모두 나열하기
dict1.keys                         // "height, "age"
dict1.keys.sorted()                // "age", "height
 
// 2. Value 모두 나열하기
dict1.values                       // 165, 100
dict1.values.sorted()              // 100, 165


//forEach  $0.key ,$0.value로 접근

 parkingLot.forEach { // 아직 출차하지 않은 차 출차 
        print($0.key)
        print($0.value)
}

// 삭제
dict.removeValue(forKey: gems[left])


// 익스텐션 
extension Dictionary where Key == Int64, Value == Int64 { // Key와 Value가  Int64 Type일 때
    mutating func getRoomNumber(_ n: Int64) -> Int64{
        guard let s = self[n] else { 
            self[n] = n + 1
            return n
        }

        let newRoom = getRoomNumber(s)
        self[n] = newRoom

        return newRoom
    }
}

// 딕셔너리 이용해서 Python CountDict 사용하기

let  tangerine : [Int] = [1, 3, 2, 5, 4, 5, 2, 3]


Dictionary(grouping: tangerine){$0} // key갑은 자기 자신
// [3: [3, 3], 5: [5, 5], 2: [2, 2], 4: [4], 1: [1]]