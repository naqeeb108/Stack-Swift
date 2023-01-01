import Foundation

public class StackWithArrays<T> {
    
    private var arrayOfElement: [T] = []
    
    init() {}
    
    public func push(value: T) {
        arrayOfElement.append(value)
    }
    
    public func pop() -> T? {
        return arrayOfElement.popLast()
    }
    
    public func peek() -> T? {
        return arrayOfElement.last
    }
    
    public func isEmpty() -> Bool {
        return arrayOfElement.isEmpty
    }
    
    public func display() {
        for i in 0..<arrayOfElement.count {
            print(arrayOfElement[i])
        }
    }
}


public class StackWithLinkedList<T> {
    
    private var top: Node?

    init() {}
    
    public func push(value: T) {
        
        let node = Node(data: value)
        
        if !isEmpty() {
            node.next = top
            top = node
        } else {
            top = node
        }
    }
    
    public func pop() {
        if isEmpty() { return }
        let temp = top?.next
        top?.next = nil
        top = temp
    }
    
    public func peek() -> T? {
        return top?.data
    }
    
    public func isEmpty() -> Bool {
        return top == nil
    }
    
    public func display() {
        var temp = top
        while temp != nil {
            print(temp?.data)
            temp = temp?.next
        }
    }
    
}

extension StackWithLinkedList {
    private class Node {
        var data: T
        var next: Node?
        
        init(data: T, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
}

func checkBalanceParentheses(string: String) -> Bool {
    let stack = StackWithArrays<String>()
    for char in string {
        if String(char) == "(" {
            stack.push(value: "(")
        }
        if String(char) == ")" {
            if !stack.isEmpty() {
                stack.pop()
            } else {
                return false
            }
        }
    }
    return stack.isEmpty()
}

print("Stack Using Array")
let stackWithArray = StackWithArrays<Int>()
stackWithArray.push(value: 2)
stackWithArray.push(value: 5)
stackWithArray.push(value: 7)
stackWithArray.pop()
stackWithArray.display()
print("peek is \(stackWithArray.peek())")
stackWithArray.pop()
print(stackWithArray.isEmpty())

print("Stack Using Linkedlist")
var stackWithLinkedlist = StackWithLinkedList<Int>()
stackWithLinkedlist.push(value: 5)
stackWithLinkedlist.push(value: 8)
stackWithLinkedlist.push(value: 11)
stackWithLinkedlist.push(value: 12)
stackWithLinkedlist.display()
print("peek is \(stackWithLinkedlist.peek())")
print("isEmpty \(stackWithLinkedlist.isEmpty())")
stackWithLinkedlist.pop()
print("peek is \(stackWithLinkedlist.peek())")
print("isEmpty \(stackWithLinkedlist.isEmpty())")
stackWithLinkedlist.pop()
print("peek is \(stackWithLinkedlist.peek())")
print("isEmpty \(stackWithLinkedlist.isEmpty())")
      
//-----------Coding Challenges-------------------
print(checkBalanceParentheses(string: ")(({bal{}}))"))
print("done")



