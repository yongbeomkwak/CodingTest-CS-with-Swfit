// isLetter, isNumber, isUppercase 등 Character의 타입을 쉽게 확인할 수 있는 메서드가 존재한다.
let str = "a1b2"
for c in str {
    print(c.isNumber)
}

// false
// true
// false
// true

// 영어만 남게 필터

var  arr1:[String] = ["A","B","3","*"]

arr1 = arr1.filter({ ("a" <= $0 && $0 <= "z") || ("A" <= $0 && $0 <= "Z") })