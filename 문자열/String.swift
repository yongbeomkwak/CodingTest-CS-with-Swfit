
extension String {

    // var a:String = "123" 
    // print(a[0]) = "1"

    subscript(_ index: Int) -> String { 
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }


    //let str = "abcde"
    //print(str[0..<4]) // abcd

    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }

}

//prefix & suffix
let str = "abcdef"

print(str.prefix(3)) // abc
print(str.prefix(4)) // abcd

print(str.suffix(1)) // f
print(str.suffix(2)) // ef

// hasPrefix & hasSuffix
// hasPrefix와 hasSuffix를 활용해 접두어 및 접미사의 존재여부를 확인할 수 있다
let str = "abcdef"

print(str.hasPrefix("a"))  // true
print(str.hasPrefix("ab")) // true
print(str.hasPrefix("ba")) // false

print(str.hasSuffix("f"))  // true
print(str.hasSuffix("ef")) // true
print(str.hasSuffix("fe")) // false

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
import Foundation

let str = "a1b2"
for c in str {
    print(c.isNumber)
}

// false
// true
// false
// true
