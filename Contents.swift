import Foundation

public class StackWithArrays<T> {
    
    private var arrayOfElement: [T] = []
    
    init() {}
    
    public func push(vale: T) {
        arrayOfElement.append(vale)
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

let stack = StackWithArrays<Int>()
stack.push(vale: 2)
stack.push(vale: 5)
stack.push(vale: 7)
stack.pop()
stack.display()
print("peek is \(stack.peek())")
stack.pop()
print(stack.isEmpty())
print("done")




