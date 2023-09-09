// 기본 배열
let arr = [1,2,3,4,5,6,7,8]

// <filter>
// 짝수만 걸러내기
let evenFilter = arr.filter { (num) -> Bool in return num % 2 == 0}
print(evenFilter)

let evenFilter2 = arr.filter { $0 % 2 == 0 }
print(evenFilter2)


// <map>
// 문자열 타입으로 바꾸기
let toString = arr.map{ (num: Int) -> String in
    return "\(num)"
}
print(toString)

let toString2 = arr.map { "\($0)" }
print(toString2)


// <reduce>
// 모든 원소를 문자열에 담아 압축하기
let arrStr = arr.reduce ("") { (first, second) -> String in
    return "\(first)\(second)"
}
print(arrStr)

let arrStr2 = arr.reduce(""){ "\($0)\($1)" }
print(arrStr2)