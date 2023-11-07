struct Queue<T> {
    
    var enque:[T]
    
    var deque:[T] = []
    
    init(_ enque: [T]) {
        self.enque = enque
    }
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    
    var front:T? {
        
        if deque.isEmpty {
            return enque.first
        }
        
        return enque.last 
        
    }
    
    mutating func pop() -> T? {
        
        if deque.isEmpty {
            
            deque = enque.reversed()
            enque.removeAll()
        }
        
        return deque.popLast()
        
    }
    
    mutating func push(_ element:T) {
        
        enque.append(element)
    }
    

    
    
}