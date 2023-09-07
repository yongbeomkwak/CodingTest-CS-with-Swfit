import Foundation

//  uppercased ,  lowercased
let str = "AbCdEfG"
print(str.uppercased()) // "ABCDEFG"
print(str.lowercased()) // "abcdefg"

// asciiValue & UnicodeScalar
// Charater 타입에서는 아스키코드를 불러올 수 있다

let str = "abcde"
for c in str {
    var ascii = c.asciiValue!
    var char = Character(UnicodeScalar(ascii))
    print(ascii)
    print(char) 
}

// 97
// a
// 98
// b
// 99
// c
// 100
// d
// 101
// e


// replacingOccurrences를 통해 쉽게 치환할 수 있다
let str = "abcde"
let newStr = str.replacingOccurrences(of: "ab", with: "zzzzzzz")
print(newStr) // zzzzzzzcde

// isLetter, isNumber, isUppercase 등 Character의 타입을 쉽게 확인할 수 있는 메서드가 존재한다.
let str = "a1b2"
for c in str {
    print(c.isNumber)
}

// false
// true
// false
// true



var a:Int = 16 // 10 -> 2 진법
print(String(a,radix: 2)) // 10000
print(String(a,radix: 8)) // 20
print(String(a,radix: 16)) // 10

var b:String = "1100" // 2->10진법
print(Int(b,radix: 2)!) // 12