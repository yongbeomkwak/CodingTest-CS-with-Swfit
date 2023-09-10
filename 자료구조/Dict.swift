//defaultDict
//딕셔너리에 없는 값을 조회할 경우 디폴트값을 설정할 수 있다.

let myDict = ["a" : 1, "b" : 2, "c" : 3]

print(myDict["d", default: -1])


//forEach  $0.key ,$0.value로 접근

 parkingLot.forEach { // 아직 출차하지 않은 차 출차 
        print($0.key)
        print($0.value)
}