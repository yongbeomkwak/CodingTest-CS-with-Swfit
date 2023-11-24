

.joined()

result.joined(separator: " ")

append(contentsOf:):  Sequence 혹은 Collection의 원소들을 사용할 수 있다. 
(배열의 아니라 Seqeuence인 점에 주목하라) 즉 배열 뿐만아니라 다른 배열의 조각(ArraySlice)이나 
Set 심지어는 원소 타입만 맞으면 셀 수 있는 범위값도 들어갈 수 있다.



arr.enumerated(): (offset,element) 튜플을 리턴 


arr.reduce(into:초기값){
    $0(초깃값) + $1(arr의 요소) 
}

arr.firstIndex(of: _elements.max()!): 왼쪽부터 최댓값 인덱스 접근 


arr.remove(at:0) : 0번 째 인덱스 제거 및 리턴 

var numbers = [1, 2, 3, 4, 5]
numbers.insert(100, at: 3)
numbers.insert(200, at: numbers.endIndex)


print(numbers)
// Prints "[1, 2, 3, 100, 4, 5, 200]"//100을 3인덱스에