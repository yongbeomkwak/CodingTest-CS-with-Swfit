import Foundation

class Node {
    var data: Int?
    var next: Node?
    var prev: Node?
    
    init(data: Int, next: Node?, prev: Node?) {
        self.data = data
        self.next = next
        self.prev = prev
    }
    

}

struct LinkedList {
    var head:Node?
    var tail:Node?
    var cursor: Node?
    var isDeleted: [Bool] = [] // 지워졌는지 추적하는 배열
    
    
    mutating func initCursor(at index: Int) {
    var node = head
    for _ in 0..<index {
        
        if node?.next == nil { break }
            node = node?.next
        }
        
        self.cursor = node
    }
    
    mutating func append(data:Int,isInitCursor: Bool){
        
        let node = Node(data:data,next:nil,prev:nil)
        
        if isInitCursor { cursor = node } // 초기 커서
        
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            node.prev = tail
            tail = node
        }
        
        isDeleted.append(false)
    }
    
    mutating func remove() -> Node? {
    
        let delNode = cursor
        
        cursor?.next?.prev = cursor?.prev
        cursor?.prev?.next = cursor?.next
        cursor = delNode?.next == nil ? delNode?.prev : delNode?.next // 다음이 없다는 것은 tail 이라는 뜻 
        
        isDeleted[delNode!.data!] = true
        return delNode
        
    
    }
    
        mutating func moveUp(to amount: Int) {
        for _ in 0..<amount {
            cursor = cursor?.prev
        }
    }
    
    mutating func moveDown(to amount: Int) {
        for _ in 0..<amount {
            cursor = cursor?.next
        }
    }
    
    mutating func restore(node: Node?) {
        node?.prev?.next = node
        node?.next?.prev = node
        isDeleted[node!.data!] = false
    }
    
    
    
    
    
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    var table = LinkedList()
    var deleteStack:[Node?] = []
    
    for i in 0..<n { table.append(data: i, isInitCursor: i == k) }
    
    for command in cmd {
        let splitCommand = command.components(separatedBy: " ")
        switch splitCommand[0] {
        case "D":
            table.moveDown(to: Int(splitCommand[1])!)
        case "U":
            table.moveUp(to: Int(splitCommand[1])!)
        case "C":
            deleteStack.append(table.remove())
        case "Z":
            table.restore(node: deleteStack.removeLast())
        default:
            break
        }
    }
    
    
    return table.isDeleted.map{$0 ? "X" : "O"}.joined()
}